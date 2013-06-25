require 'spec/test/unit'
require 'lib/amo_lint_extensions'

share_examples_for 'an active_model/validations compliant object' do

  include ActiveModel::Lint::Tests::Validations

  ActiveModel::Lint::Tests::Validations::VALIDATION_METHODS.each do |validation_method|
    it "must implement the .#{validation_method} interface" do
      send("test_#{validation_method}")
    end
  end
end
