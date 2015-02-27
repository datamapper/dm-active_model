RSpec.shared_examples_for 'an active_model compliant object' do

  include ActiveModel::Lint::Tests

  instance_methods.grep(/^test_/).each do |meth|
    it meth.to_s do
      send(meth)
    end
  end
end
