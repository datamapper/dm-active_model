require 'rspec'
require 'test/unit/assertions'

require 'dm-core'
require 'dm-active_model'

require 'active_support/core_ext/object/blank'  # needed by active_model/lint
require 'active_model/lint'

require 'amo_interface_compliance_examples'

if ENV['DM_VALIDATIONS'] || ENV['AMO_VALIDATIONS']
  require 'dm-validations'
  require 'lib/amo_lint_extensions'
  require 'amo_validation_compliance_examples'
end

RSpec.configure do |config|
  config.include Test::Unit::Assertions
end
