require 'spec_helper'

describe PropertiesController do
  describe "Given a food thing" do
    before do
      @apple = Factory(:thing)
    end

    describe "on POST to #create for that thing with valid properties" do
      before do
        post :create,
          :thing_id => @apple.to_param,
          :properties => {:color => "green", :is_a => "fruit"},
          :format => :json
      end

      it 'should respond successfully' do
        response.should be_success
      end

      it 'should add properties to the thing' do
        @apple.properties.count.should == 2
      end

      it 'should respond with the thing in json' do
        json_response["id"].should == @apple.id
      end
    end
  end
end
