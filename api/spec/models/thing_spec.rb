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
end
