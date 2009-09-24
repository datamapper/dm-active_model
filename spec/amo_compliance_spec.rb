describe 'every active_model compliant object', :shared => true do

  it 'must pass the official active_model/lint test' do
    ActiveModel::Lint.test(@object).should be_passed
  end

end
