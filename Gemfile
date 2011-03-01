require 'pathname'

source 'http://rubygems.org'

SOURCE       = ENV.fetch('SOURCE', :git).to_sym
REPO_POSTFIX = SOURCE == :path ? ''                                : '.git'
DATAMAPPER   = SOURCE == :path ? Pathname(__FILE__).dirname.parent : 'http://github.com/datamapper'
DM_VERSION   = '~> 1.1.0.rc1'

group :runtime do

  gem 'activesupport', '~> 3.0.4', :require => nil
  gem 'activemodel',   '~> 3.0.4', :require => nil
  gem 'dm-core',       DM_VERSION, SOURCE => "#{DATAMAPPER}/dm-core#{REPO_POSTFIX}"
  gem 'i18n',          '~> 0.5.0'

end

group :development do

  gem 'dm-validations', DM_VERSION, SOURCE => "#{DATAMAPPER}/dm-validations#{REPO_POSTFIX}"
  gem 'jeweler',        '~> 1.5.2'
  gem 'rake',           '~> 0.8.7'
  gem 'rspec',          '~> 1.3.1'
  gem 'test-unit',      '= 1.2.3'

end

group :quality do

  gem 'rcov',      '~> 0.9.9', :platforms => :mri_18
  gem 'yard',      '~> 0.6'
  gem 'yardstick', '~> 0.1'

end

group :datamapper do

  plugins = ENV['PLUGINS'] || ENV['PLUGIN']
  plugins = plugins.to_s.tr(',', ' ').split.uniq

  plugins.each do |plugin|
    gem plugin, DM_VERSION, SOURCE => "#{DATAMAPPER}/#{plugin}#{REPO_POSTFIX}"
  end

end
