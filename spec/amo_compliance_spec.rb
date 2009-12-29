require 'spec/test/unit'

share_examples_for 'an active_model compliant object' do
  include ActiveModel::Lint::Tests

  it 'must implement the #valid? interface' do
    test_valid?
  end

  it 'must implement the #new_record? interface' do
    test_new_record?
  end

  it 'must implement the #destroyed? interface' do
    test_destroyed?
  end

  it 'must implement the #destroyed? interface' do
    test_destroyed?
  end

  it 'must implement the #errors interface' do
    test_errors_aref
    test_errors_full_messages
  end
end
