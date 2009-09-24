# TODO move these specs into rails_datamapper
require 'active_model/naming'

describe 'every active_model compliant object that is compatible with rails', :shared => true do

  it '#class.model_name.singular should follow active_model conventions' do
    @object.class.model_name.singular.should == @model_name_singular
  end

  it '#class.model_name.plural should follow active_model conventions' do
    @object.class.model_name.plural.should == @model_name_plural
  end

  it '#class.model_name.element should follow active_model conventions' do
    @object.class.model_name.element.should == @model_name_element
  end

  it '#class.model_name.human should follow active_model conventions' do
    @object.class.model_name.human.should == @model_name_human
  end

  it '#class.model_name.collection should follow active_model conventions' do
    @object.class.model_name.collection.should == @model_name_collection
  end

  it '#class.model_name.partial_path should follow active_model conventions' do
    @object.class.model_name.partial_path.should == @model_name_partial_path
  end

end

describe 'An active_model compliant DataMapper::Resource that is compatible with rails3' do

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

    @object                  = ComplianceTest::ProfileInfo.create.to_model

    @model_name_singular     = ::ActiveModel::Name.new(@object.class.name).singular
    @model_name_plural       = ::ActiveModel::Name.new(@object.class.name).plural
    @model_name_element      = ::ActiveModel::Name.new(@object.class.name).element
    @model_name_human        = ::ActiveModel::Name.new(@object.class.name).human
    @model_name_collection   = ::ActiveModel::Name.new(@object.class.name).collection
    @model_name_partial_path = ::ActiveModel::Name.new(@object.class.name).partial_path

  end

  it_should_behave_like 'every active_model compliant object'
  it_should_behave_like 'every active_model compliant object that is compatible with rails'

end