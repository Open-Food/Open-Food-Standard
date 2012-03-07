require 'spec_helper'

describe FoodsController do
  describe "Given some foods" do
    before do
      @tomato = Factory(:food, :name => "tomato")
      2.times { Factory(:food) }
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

      it 'should respond with a JSON representation of a food found' do
        json_response.size.should == 1
        json_response.first["uuid"].should == @tomato.uuid
        json_response.first["name"].should == @tomato.name
      end
    end

    describe 'on GET to #show with a valid food' do
      before do
        get :show, :id => @tomato.to_param, :format => :json
      end

      it 'should respond with the json representation of the food' do
        json_response.should_not be_nil
        json_response["name"].should == @tomato.name
      end
    end
  end

  describe "Given more than a page of foods" do
    before do
      27.times { Factory(:food) }
    end

    describe "on GET to #index via json" do
      before do
        get :index, :format => :json
      end

      it 'should only return the first page of foods' do
        json_response.size.should == 25
      end
    end

    describe "on GET to #index for page 2 via json" do
      before do
        get :index, :page => 2, :format => :json
      end

      it 'should return page 2' do
        json_response.size.should == 2
      end
    end
  end

  describe "on POST to #create via json with valid items" do
    before do
      post :create, :food => {:name => "Apple"}, :format => :json
    end

    it 'should create a food' do
      Food.count.should == 1
      Food.first.name.should == "Apple"
    end

    it 'should respond with the created apple' do
      json_response.should_not be_nil
      json_response["name"].should == "Apple"
    end
  end

  describe "on POST to #create via json with valid attributes and properties" do
    before do
      post :create,
        :food => {:name => "Apple", :properties => [{:name => "type_of", :value =>"Fruit"}, {:name => "color", :value => "green"}]},
        :format => :json
    end

    it 'should create an apple with the relevant properties' do
      Food.count.should == 1
      created_food = Food.first
      created_food.properties.count.should == 2
      created_food.properties.first.name.should == "type_of"
      created_food.properties.first.value.should == "Fruit"
    end
  end
end
