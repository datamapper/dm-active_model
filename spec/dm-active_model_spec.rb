require 'dm-core'
require 'dm-active_model'

require 'amo_interface_compliance_spec'

if ENV['DM_VALIDATIONS'] || ENV['AMO_VALIDATIONS']
  require 'dm-validations'
  require 'amo_validation_compliance_spec'
end

describe 'An active_model compliant DataMapper::Resource' do

  before :all do

    module ::ComplianceTest
      class ProfileInfo
        include DataMapper::Resource
        property :id, Serial
      end
    end

    DataMapper.setup(:default, { :adapter => :in_memory })

  end

  before :each do
    @model = ComplianceTest::ProfileInfo.new.to_model
  end

  it_should_behave_like 'an active_model compliant object'

  if ENV['AMO_VALIDATIONS'] == 'true'
    it_should_behave_like 'an active_model/validations compliant object'
  end

end
