class PropertiesController < ApplicationController
  respond_to :json

  def create
    thing = Thing.find(params[:thing_id])
    if thing
      params[:properties].each do |property, value|
        thing.properties.create(:name => property, :value => value)
      end
    end
    respond_with thing, :location => "/"
  end
end
