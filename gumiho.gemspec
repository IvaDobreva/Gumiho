# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gumiho/version'

Gem::Specification.new do |spec|
  spec.name          = "gumiho"
  spec.version       = '0.0.2'
  spec.authors       = ["IvaDobreva"]
  spec.email         = ["iva95dobreva@gmail.com"]
  spec.description   = %q{Ruby gem for creating online RESTful API documentation with possibility to test different HTTP requests}
  spec.summary       = %q{Create API documentation}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = 'gumiho-export'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_runtime_dependency "choice", "~> 0.1.6"
end
