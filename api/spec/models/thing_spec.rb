require 'spec_helper'

describe Thing do
  before do
    @attr = Factory.attributes_for(:thing)
  end

  it 'should be valid' do
    Thing.new(@attr).should be_valid
  end

  it 'should require a name' do
    Thing.new(@attr.merge(:name => nil)).should_not be_valid
  end

  describe "a thing with a property" do
    before do
      @thing = Thing.create(@attr)
      @property_one = Factory(:property, :thing => @thing)
    end

    it 'should show the properties in the json representation' do
      json_thing = @thing.to_json
      parsed_thing = ActiveSupport::JSON.decode(json_thing)
      parsed_thing["properties"].size.should == 1
      parsed_thing["properties"].first["name"].should == @property_one.name
    end
  end
end
