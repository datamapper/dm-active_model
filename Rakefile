require 'rubygems'
require 'rake'

begin
  gem 'jeweler', '~> 1.6.4'
  require 'jeweler'

  Jeweler::Tasks.new do |gem|
    gem.name        = 'dm-active_model'
    gem.summary     = 'active_model compliance for datamapper'
    gem.description = 'A datamapper plugin for active_model compliance and thus rails 3 compatibility.'
    gem.email       = 'gamsnjaga [a] gmail [d] com'
    gem.homepage    = 'http://github.com/datamapper/%s' % gem.name
    gem.authors     = [ 'Martin Gamsjaeger (snusnu)' ]
    gem.has_rdoc    = 'yard'

    gem.rubyforge_project = 'datamapper'
  end

  Jeweler::GemcutterTasks.new

  FileList['tasks/**/*.rake'].each { |task| import task }
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end
