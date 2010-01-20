require 'rubygems'
require 'rake'

require File.expand_path('../lib/dm-active_model/version', __FILE__)

begin

  gem 'jeweler', '~> 1.4'
  require 'jeweler'

  Jeweler::Tasks.new do |gem|

    gem.version     = DataMapper::ActiveModel::VERSION

    gem.name        = 'dm-active_model'
    gem.summary     = 'active_model compliance for datamapper'
    gem.description = 'A datamapper plugin for active_model compliance and thus rails 3 compatibility.'
    gem.email       = 'gamsnjaga [a] gmail [d] com'
    gem.homepage    = 'http://github.com/snusnu/dm-active_model'
    gem.authors     = [ 'Martin Gamsjaeger (snusnu)' ]

    gem.add_dependency 'dm-core', '~> 0.10'

    gem.add_development_dependency 'rspec', '>= 1.2.9'
    gem.add_development_dependency 'yard',  '~> 0.5'

  end

  Jeweler::GemcutterTasks.new

  FileList['tasks/**/*.rake'].each { |task| import task }
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end
