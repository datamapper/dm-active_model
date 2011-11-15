# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dm-active_model/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors     = [ "Martin Gamsjaeger (snusnu)" ]
  gem.email       = [ "gamsnjaga [a] gmail [d] com" ]
  gem.summary     = "active_model compliance for datamapper"
  gem.description = 'A datamapper plugin for active_model compliance and thus rails 3 compatibility.'
  gem.homepage    = "http://datamapper.org"

  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.rdoc]

  gem.name          = "dm-active_model"
  gem.require_paths = [ "lib" ]
  gem.version       = DataMapper::ActiveModel::VERSION

  gem.add_runtime_dependency('dm-core', '~> 1.3.0.beta')

  gem.add_development_dependency('rake',      '~> 0.9.2')
  gem.add_development_dependency('rspec',     '~> 1.3.2')
  gem.add_development_dependency('test-unit', '= 1.2.3')
end

