require 'rubygems'
require 'rake'

begin
  gem 'jeweler', '~> 1.4'
  require 'jeweler'

  Jeweler::Tasks.new do |gem|
    gem.name        = 'dm-active_model'
    gem.summary     = 'active_model compliance for datamapper'
    gem.description = 'A datamapper plugin for active_model compliance and thus rails 3 compatibility.'
    gem.email       = 'gamsnjaga [a] gmail [d] com'
    gem.homepage    = 'http://github.com/datamapper/%s' % gem.name
    gem.authors     = [ 'Martin Gamsjaeger (snusnu)' ]

    gem.rubyforge_project = 'datamapper'

    gem.add_dependency 'dm-core',     '~> 1.0.0'
    gem.add_dependency 'activemodel', '~> 3.0.0.beta3'

    gem.add_development_dependency 'dm-validations', '~> 1.0.0'
    gem.add_development_dependency 'rspec',          '~> 1.3'
    gem.add_development_dependency 'test-unit',      '= 1.2.3'
  end

  Jeweler::GemcutterTasks.new

  FileList['tasks/**/*.rake'].each { |task| import task }
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end
