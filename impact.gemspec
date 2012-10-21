# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'impact/version'

Gem::Specification.new do |gem|
  gem.name          = "impact"
  gem.version       = Impact::VERSION
  gem.authors       = ["Piotr Murach"]
  gem.email         = [""]
  gem.description   = %q{Ruby backend for Impact.js framework}
  gem.summary       = %q{Ruby backend for Impact.js framework}
  gem.homepage      = "http://github.com/peter-murach/impact"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'sinatra'
  gem.add_dependency 'json'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'yard'
end
