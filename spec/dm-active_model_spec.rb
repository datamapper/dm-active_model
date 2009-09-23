require 'spec_helper'

describe 'An active_model compliant DataMapper::Resource' do

  before :all do

    module ::ComplianceTest
      class ProfileInfo
        include DataMapper::Resource
        property :id, Serial
      end
    end

    DataMapper.setup(:default, 'sqlite3::memory:')
    DataMapper.auto_migrate!

  end

  before :each do
    @object = ComplianceTest::ProfileInfo.create.to_model
    @model_name_singular     = 'compliance_test_profile_info'
    @model_name_plural       = 'compliance_test_profile_infos'
    @model_name_element      = 'profile_info'
    @model_name_human        = 'profile info'
    @model_name_collection   = 'compliance_test_profile_infos'
    @model_name_partial_path = 'compliance_test_profile_infos/profile_info'
  end

  it_should_behave_like 'every active_model compliant object'

end
