if RUBY_VERSION =~ /1.9.[0-9]/
  require 'fileutils'
else
  require 'ftools'
end

require 'mongoid'
require 'mongo'
require 'mime/types'
require 'tempfile'
require 'miso'

module Grip
  class GripError < StandardError;
  end
  class InvalidFile < GripError;
  end
end

require 'grip/attachment'
require 'grip/has_attachment'
