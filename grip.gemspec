# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{grip}
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["twoism", "jnunemaker"]
  s.date = %q{2010-02-17}
  s.description = %q{GridFS attachments for MongoMapper}
  s.email = %q{signalstatic@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "grip.gemspec",
     "lib/grip.rb",
     "lib/grip/attachment.rb",
     "lib/grip/has_attachment.rb",
     "test/factories.rb",
     "test/fixtures/cthulhu.png",
     "test/fixtures/fennec-fox.jpg",
     "test/fixtures/sample.pdf",
     "test/grip_attachment_test.rb",
     "test/has_attachment_test.rb",
     "test/models.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/twoism/grip}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{GridFS attachments for MongoMapper}
  s.test_files = [
    "test/factories.rb",
     "test/grip_attachment_test.rb",
     "test/has_attachment_test.rb",
     "test/models.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, [">= 2.0.0.beta3"])
      s.add_runtime_dependency(%q<miso>, [">= 0.3.1"])
      s.add_development_dependency(%q<factory_girl>, ["= 1.2.3"])
      s.add_development_dependency(%q<shoulda>, ["= 2.10.2"])
    else
      s.add_dependency(%q< mongoid>, [">= 2.0.0.beta3"])
      s.add_dependency(%q<miso>, [">= 0.3.1"])
      s.add_dependency(%q<factory_girl>, ["= 1.2.3"])
      s.add_dependency(%q<shoulda>, ["= 2.10.2"])
    end
  else
    s.add_dependency(%q<mongoid>, [">= 2.0.0.beta3"])
    s.add_dependency(%q<miso>, [">= 0.3.1"])
    s.add_dependency(%q<factory_girl>, ["= 1.2.3"])
    s.add_dependency(%q<shoulda>, ["= 2.10.2"])
  end
end

