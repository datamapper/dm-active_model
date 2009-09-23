describe 'every active_model compliant object', :shared => true do

  it 'a compliant object should respond_to #to_model' do
    @object.respond_to?(:to_model).should be_true
  end
  it 'a compliant object should respond_to #new_record?' do
    @object.respond_to?(:new_record?).should be_true
  end
  it 'a compliant object should respond_to #destroyed?' do
    @object.respond_to?(:destroyed?).should be_true
  end
  it 'a compliant object should respond_to #valid?' do
    @object.respond_to?(:valid?).should be_true
  end
  it 'a compliant object should respond_to #errors' do
    @object.respond_to?(:errors).should be_true
  end
  it 'a compliant object should respond_to #class.model_name' do
    @object.class.respond_to?(:model_name).should be_true
  end

  it '#new_record? should either return true or false' do
    (@object.new_record? == true || @object.new_record? == false).should be_true
  end
  it '#destroyed? should either return true or false' do
    (@object.destroyed? == true || @object.destroyed? == false).should be_true
  end
  it '#valid? should either return true or false' do
    (@object.valid? == true || @object.valid? == false).should be_true
  end

  it '#errors should return an object that responds to #[](field)' do
    @object.errors.respond_to?(:[]).should be_true
  end
  it '#errors should return an object that responds to #full_messages' do
    @object.errors.respond_to?(:full_messages).should be_true
  end

  it '#class.model_name should return an object that responds to #singular' do
    @object.class.model_name.respond_to?(:singular).should be_true
  end
  it '#class.model_name should return an object that responds to #plural' do
    @object.class.model_name.respond_to?(:plural).should be_true
  end
  it '#class.model_name should return an object that responds to #element' do
    @object.class.model_name.respond_to?(:element).should be_true
  end
  it '#class.model_name should return an object that responds to #human' do
    @object.class.model_name.respond_to?(:human).should be_true
  end
  it '#class.model_name should return an object that responds to #collection' do
    @object.class.model_name.respond_to?(:collection).should be_true
  end
  it '#class.model_name should return an object that responds to #partial_path' do
    @object.class.model_name.respond_to?(:partial_path).should be_true
  end

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
