# encoding: utf-8

module Grip
    JPEGBestQuality = 80
    JPEGMediumQuality = 65
    JPEGLowQuality = 30
    
  module HasAttachment

    def self.included(base)
      base.extend ClassMethods
      base.instance_eval do
        embeds_many  :attachments
      end
    end

    module ClassMethods

      def has_grid_attachment name, opts={}
        set_callbacks_once

        write_inheritable_attribute(:uploaded_file_options, {}) if uploaded_file_options.nil?
        uploaded_file_options[name] = opts
        self.send(:include, InstanceMethods)

        define_method(name) do
          attachments.find(:first, :conditions=>{:name => name.to_s})
        end

        define_method("#{name}=") do |new_file|
					return if new_file.nil? || (new_file.is_a?(String) && new_file.blank?)
          raise InvalidFile unless (new_file.is_a?(File) || new_file.is_a?(Tempfile))
          uploaded_files[name] ||= {}
          uploaded_files[name][:file] = new_file
          self['_id'] = Mongo::ObjectID.new if _id.blank?
          new_attachment = attachments.find_or_create_by_name(name.to_s)
          update_attachment_attributes!(new_attachment, new_file, opts)
        end

      end
@i = 0
      def set_callbacks_once
           
        after_save :save_attachments unless @i == 1
        @i = 1 unless @i == 1
        
      end

      def uploaded_file_options
        read_inheritable_attribute(:uploaded_file_options)
      end

    end

    module InstanceMethods
      def uploaded_files
        @uploaded_files ||= {}
      end

      def update_attachment_attributes! new_attachment, new_file, opts
        new_attachment.owner_type   = self.class.to_s
        new_attachment.file_name    = File.basename(new_file.path)
        new_attachment.file_size    = File.size(new_file.path)
        
        # ruby 1.9 mime type hack
        new_attachment.content_type = MIME::Types.type_for(new_file.path)[0].content_type rescue MIME::Types.type_for(new_file.path)
        
        new_attachment.file         = new_file
        new_attachment.variants     = opts[:variants] || {}
        new_attachment.save!
      end

      def save_attachments
        attachments.each do |attachment|
          attachment.variants.each do |variant, dimensions|
            create_variant(attachment, variant, dimensions)
          end
        end
      end
      
      def create_variant(attachment, variant, dimensions, quality=JPEGMediumQuality)
        tmp_file = uploaded_files[attachment.name.to_sym][:file]
        begin
          tmp   = Tempfile.new("#{attachment.name}_#{variant}")
          
          image = Magick::Image.read(tmp_file.path)[0]
          image.resize_to_fill!(dimensions[:width], dimensions[:height])
          
          image.write(tmp.path) do |opts|
              opts.format = "JPG"
              opts.compression = JPEGCompression
              opts.quality = quality
          end
        rescue RuntimeError => e
          warn "Image was not resized. #{e}"
          tmp = tmp_file
        end

        file_hash = {:resized_file => tmp, :uploaded_file => tmp_file}
        attachment.send("#{variant}=", file_hash)
      end

    end


  end
end
