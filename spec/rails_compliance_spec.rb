# TODO move these specs into rails_datamapper
require 'active_model/naming'

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
    @object = ComplianceTest::ProfileInfo.create.to_model
  end

  it_should_behave_like 'every active_model compliant object'

  it '#class.model_name.singular should follow active_model conventions' do
    @object.class.model_name.singular.should == ActiveModel::Name.new(@object.class.name).singular
  end

  it '#class.model_name.plural should follow active_model conventions' do
    @object.class.model_name.plural.should == ActiveModel::Name.new(@object.class.name).plural
  end

  it '#class.model_name.element should follow active_model conventions' do
    @object.class.model_name.element.should == ActiveModel::Name.new(@object.class.name).element
  end

  it '#class.model_name.human should follow active_model conventions' do
    @object.class.model_name.human.should == ActiveModel::Name.new(@object.class.name).human
  end

  it '#class.model_name.collection should follow active_model conventions' do
    @object.class.model_name.collection.should == ActiveModel::Name.new(@object.class.name).collection
  end

  it '#class.model_name.partial_path should follow active_model conventions' do
    @object.class.model_name.partial_path.should == ActiveModel::Name.new(@object.class.name).partial_path
  end

end