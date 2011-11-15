require 'pathname'

source :rubygems

gemspec

SOURCE         = ENV.fetch('SOURCE', :git).to_sym
REPO_POSTFIX   = SOURCE == :path ? ''                                : '.git'
DATAMAPPER     = SOURCE == :path ? Pathname(__FILE__).dirname.parent : 'http://github.com/datamapper'
DM_VERSION     = '~> 1.3.0.beta'
CURRENT_BRANCH = ENV.fetch('GIT_BRANCH', 'master')
RAILS_VERSION  = '~> 3.1.0'

gem 'dm-core',     DM_VERSION,
  SOURCE  => "#{DATAMAPPER}/dm-core#{REPO_POSTFIX}",
  :branch => CURRENT_BRANCH

gem 'activemodel', RAILS_VERSION, :require => nil

group :development do
  gem 'dm-validations', DM_VERSION,
    SOURCE  => "#{DATAMAPPER}/dm-validations#{REPO_POSTFIX}",
    :branch => CURRENT_BRANCH
end

platforms :mri_18 do
  group :quality do

    gem 'rcov',      '~> 0.9.10'
    gem 'yard',      '~> 0.7.2'
    gem 'yardstick', '~> 0.4'

  end
end

group :datamapper do

  plugins = ENV['PLUGINS'] || ENV['PLUGIN']
  plugins = plugins.to_s.tr(',', ' ').split.uniq

  plugins.each do |plugin|
    gem plugin, DM_VERSION,
      SOURCE  => "#{DATAMAPPER}/#{plugin}#{REPO_POSTFIX}",
      :branch => CURRENT_BRANCH
  end

end
