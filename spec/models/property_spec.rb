require 'spec_helper'

describe Property do
  before do
    @attr = Factory.attributes_for(:property, :thing => Factory(:thing))
  end

  it 'should be valid' do
    Property.new(@attr).should be_valid
  end

  it 'should require a thing' do
    Property.new(@attr.merge(:thing => nil)).should_not be_valid
  end

  it 'should require a name and value' do
    [:name, :value].each do |attribute|
      Property.new(@attr.merge(attribute => nil)).should_not be_valid
    end
  end
end
