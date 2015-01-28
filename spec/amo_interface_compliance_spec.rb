require 'spec/test/unit'
require 'active_support/core_ext/object/blank'  # needed by active_model/lint
require 'active_model/lint'
require 'active_support/core_ext/string'

# This must be kept in sync with active_model/lint tests
# at least for as long as
#
#   http://rspec.lighthouseapp.com/projects/5645/tickets/900
#
# isn't resolved in some way (probably with rspec2)

share_examples_for 'an active_model compliant object' do

  include ActiveModel::Lint::Tests

  instance_methods.grep(/^test_/).each do |meth|
    it meth.to_s do
      send(meth)
    end
  end
end
