require 'spec_helper'

describe "routing to foods" do

  it "routes /foods to things#index" do
    { :get => "/foods" }.should route_to(:controller => "things", :action => "index")
  end
end
