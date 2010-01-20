require 'rubygems'

# Use local dm-core if running from a typical dev checkout.
lib = File.expand_path('../../../dm-core/lib', __FILE__)
$LOAD_PATH.unshift(lib) if File.directory?(lib)
require 'dm-core'

# Use local active_model if running from a typical dev checkout.
lib = File.expand_path('../../../rails/activemodel/lib', __FILE__)
$LOAD_PATH.unshift(lib) if File.directory?(lib)
require 'active_model/lint'

require 'dm-active_model'
require 'amo_compliance_spec'

def load_driver(name, default_uri)
  return false if ENV['ADAPTER'] != name.to_s

  begin
    DataMapper.setup(name, ENV["#{name.to_s.upcase}_SPEC_URI"] || default_uri)
    DataMapper::Repository.adapters[:default] =  DataMapper::Repository.adapters[name]
    true
  rescue LoadError => e
    warn "Could not load do_#{name}: #{e}"
    false
  end
end

ENV['ADAPTER'] ||= 'sqlite3'

HAS_SQLITE3  = load_driver(:sqlite3,  'sqlite3::memory:')
HAS_MYSQL    = load_driver(:mysql,    'mysql://localhost/dm_core_test')
HAS_POSTGRES = load_driver(:postgres, 'postgres://postgres@localhost/dm_core_test')


Spec::Runner.configure do |config|

  config.before(:all) do

    # Support testing with(out)
    # dm-validations enabled

    if ENV['USE_DM_VALIDATIONS'] == 'true'
      require 'dm-validations'
    end

  end

end
