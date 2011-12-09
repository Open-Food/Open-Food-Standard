class PropertiesController < ApplicationController
  respond_to :json

  def create
    thing = Thing.find(params[:thing_id])
    if thing
      params[:properties].each do |property|
        thing.properties.create(property)
      end
    end
    respond_with thing, :location => "/"
  end
end
