require 'spec_helper'

describe Food do
  before do
    @attr = Factory.attributes_for(:food)
  end

  it 'should be valid' do
    Food.new(@attr).should be_valid
  end

  it 'should require a name' do
    Food.new(@attr.merge(:name => nil)).should_not be_valid
  end

  it 'should not be valid when the same name is used' do
    Food.create(@attr.merge(:name => "apple"))
    Food.new(@attr.merge(:name => "apple")).should_not be_valid
  end

  describe "a food with a property" do
    before do
      @food = Food.create(@attr)
      @property_one = Factory(:property, :food => @food)
    end

    it 'should show the properties in the json representation' do
      json_food = @food.to_json
      parsed_food = ActiveSupport::JSON.decode(json_food)
      parsed_food["properties"].size.should == 1
      parsed_food["properties"].first["name"].should == @property_one.name
    end
  end
end
