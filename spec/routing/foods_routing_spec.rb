require 'spec_helper'

describe "routing to foods" do

  it "routes /foods to foods#index" do
    { :get => "/foods" }.should route_to(:controller => "foods", :action => "index")
  end

  it "routes /foods/:id to foods#show" do
    { :get => "/foods/123"}.should route_to(:controller => "foods", :action => "show", :id => "123")
  end
end
