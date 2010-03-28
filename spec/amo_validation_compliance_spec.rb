require 'spec/test/unit'
require 'amo_lint_extensions'

# This must be kept in sync with active_model/lint tests
# at least for as long as
#
#   http://rspec.lighthouseapp.com/projects/5645/tickets/900
#
# isn't resolved in some way (probably with rspec2)

share_examples_for 'an active_model/validations compliant object' do

  include ActiveModel::Lint::Tests::Validations

  ActiveModel::Lint::Tests::Validations::VALIDATION_METHODS.each do |validation_method|
    it "must implement the .test_#{validation_method} interface" do
      send("test_#{validation_method}")
    end
  end

end
