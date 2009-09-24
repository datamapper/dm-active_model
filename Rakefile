require 'pathname'

ROOT    = Pathname(__FILE__).dirname.expand_path
JRUBY   = RUBY_PLATFORM =~ /java/
WINDOWS = Gem.win_platform?
SUDO    = (WINDOWS || JRUBY) ? '' : ('sudo' unless ENV['SUDOLESS'])

require ROOT + 'lib/dm-active_model/version'

AUTHOR = 'Martin Gamsjaeger (snusnu)'
EMAIL  = 'gamsnjaga [a] gmail [d] com'
GEM_NAME = 'dm-active_model'
GEM_VERSION = DataMapper::ActiveModel::VERSION
GEM_DEPENDENCIES = [['dm-core', '~>0.10']]
GEM_CLEAN = %w[ log pkg coverage ]
GEM_EXTRAS = { :has_rdoc => true, :extra_rdoc_files => %w[ README.rdoc LICENSE History.rdoc ] }

PROJECT_NAME = 'dm-active_model'
PROJECT_URL  = "http://github.com/snusnu/dm-active_model"
PROJECT_DESCRIPTION = PROJECT_SUMMARY = 'DataMapper plugin that makes datamapper active_model compliant'

[ ROOT, ROOT.parent ].each do |dir|
  Pathname.glob(dir.join('tasks/**/*.rb').to_s).each { |f| require f }
end


# hoe specific settings
# this will ease migration to dm-more if that's desired

require 'hoe'

# remove the hoe test task
# (we have our own, with custom spec.opts file reading)
Hoe.plugins.delete(:test)

Hoe.spec(GEM_NAME) do
  developer(AUTHOR, EMAIL)

  self.version      = GEM_VERSION
  self.description  = PROJECT_DESCRIPTION
  self.summary      = PROJECT_SUMMARY
  self.url          = PROJECT_URL
  self.readme_file  = 'README.rdoc'
  self.history_file = 'History.rdoc'

  self.rubyforge_name = PROJECT_NAME if PROJECT_NAME

  clean_globs |= GEM_CLEAN
  extra_deps  |= GEM_DEPENDENCIES

  self.spec_extras = GEM_EXTRAS if GEM_EXTRAS
end
