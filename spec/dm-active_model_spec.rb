require 'spec_helper'

RSpec.describe 'An active_model compliant DataMapper::Resource' do
  before :all do
    module ::ComplianceTest
      class ProfileInfo
        include DataMapper::Resource
        extend ActiveModel::Naming
        property :id, Serial
      end
    end

    DataMapper.setup(:default, { :adapter => :in_memory })
  end

  before :each do
    @model = ComplianceTest::ProfileInfo.new.to_model
  end

  include_examples 'an active_model compliant object'

  if ENV['AMO_VALIDATIONS'] == 'true'
    include_examples 'an active_model/validations compliant object'
  end
end
