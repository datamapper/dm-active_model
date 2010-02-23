# This will setup a complete development environment
#
#   git clone git://github.com/snusnu/dm-active_model
#   cd dm-active_model
#   gem install bundler (if you haven't done so before)
#   bundle install
#   rake spec
#

source 'http://gemcutter.org'

git 'git://github.com/rails/rails.git'
gem 'activesupport', '~> 3.0.0.beta1', :require => 'active_support'
gem 'activemodel',   '~> 3.0.0.beta1', :require => 'active_model'

git 'git://github.com/snusnu/dm-core.git', 'branch' => 'active_support'
gem 'dm-core', '~> 0.10'

group(:test) do
  gem 'rspec',      '~> 1.3'
  gem 'do_sqlite3', '~> 0.10.1'
end

group(:development) do
  gem 'rake'
  gem 'jeweler', '~> 1.4'
end
