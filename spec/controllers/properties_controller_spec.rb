require 'spec_helper'

describe PropertiesController do
  describe "Given a food food" do
    before do
      @apple = Factory(:food)
    end

    describe "on POST to #create for that food with valid properties" do
      before do
        post :create,
          :food_id => @apple.to_param,
          :properties => [
            {:name =>"color", :value => "green"},
            {:name =>"is_a", :value => "fruit"}
          ],
          :format => :json
      end

      it 'should respond successfully' do
        response.should be_success
      end

      it 'should add properties to the food' do
        @apple.properties.count.should == 2
      end

      it 'should respond with the food in json' do
        json_response["uuid"].should == @apple.uuid
      end
    end
  end
end
