require 'spec_helper'

describe 'An active_model compliant DataMapper::Resource' do

  before :all do

    module ComplianceTest
      class ProfileInfo
        include DataMapper::Resource
        property :id, Serial
      end
    end

    DataMapper.setup(:default, 'sqlite3::memory:')
    DataMapper.auto_migrate!

  end

  before :each do
    @model = ComplianceTest::ProfileInfo.create.to_model
  end

  it_should_behave_like 'an active_model compliant object'

end
