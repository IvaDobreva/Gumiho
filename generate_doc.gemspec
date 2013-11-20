# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'generate_doc/version'

Gem::Specification.new do |spec|
  spec.name          = "generate_doc"
  spec.version       = GenerateDoc::VERSION
  spec.authors       = ["IvaDobreva"]
  spec.email         = ["iva95dobreva@gmail.com"]
  spec.description   = %q{Slon}
  spec.summary       = %q{Mlon}
  spec.homepage      = ""
  spec.license       = ""

  spec.files         = ["lib/generate_doc.rb", "lib/generate_doc/command_line_params.rb"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
