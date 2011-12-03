require 'spec_helper'

describe ThingsController do
  describe "Given some things" do
    before do
      @tomato = Factory(:thing, :name => "tomato")
      2.times { Factory(:thing) }
    end

    describe 'on #GET to index with keywords via json' do
      before do
        get :index, :keywords => "tomato", :format => :json
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
  end
end
