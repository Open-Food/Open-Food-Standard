require 'spec_helper'

describe ThingsController do
  describe "Given some things" do
    before do
      @tomato = Factory(:thing, :name => "tomato")
      2.times { Factory(:thing) }
    end

    describe 'on GET to #index with name via json' do
      before do
        get :index, :name => "tomato", :format => :json
      end

      it 'should return successfully' do
        response.should be_success
      end

      it 'should respond with json' do
        response.content_type.should == "application/json"
      end

      it 'should respond with a JSON representation of a thing found' do
        json_response.size.should == 1
        json_response.first["id"].should == @tomato.id
        json_response.first["name"].should == @tomato.name
      end
    end

    describe 'on GET to #show with a thing id' do
      before do
        get :show, :id => @tomato.id, :format => :json
      end

      it 'should respond with the json representation of the thing' do
        json_response.should_not be_nil
        json_response["name"].should == @tomato.name
      end
    end
  end

  describe "on POST to #create via json with valid items" do
    before do
      post :create, :thing => {:name => "Apple"}, :format => :json
    end

    it 'should create a thing' do
      Thing.count.should == 1
      Thing.first.name.should == "Apple"
    end

    it 'should respond with the created apple' do
      json_response.should_not be_nil
      json_response["name"].should == "Apple"
    end
  end

  describe "on POST to #create via json with valid attributes and properties" do
    before do
      post :create,
        :thing => {:name => "Apple", :type_of => "Fruit", :color => "green"},
        :format => :json
    end

    it 'should create an apple with the relevant properties' do
      Thing.count.should == 1
      created_thing = Thing.first
      created_thing.properties.count.should == 2
      created_thing.properties.first.name.should == "type_of"
      created_thing.properties.first.value.should == "Fruit"
    end
  end
end
