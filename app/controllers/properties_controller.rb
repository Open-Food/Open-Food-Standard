class PropertiesController < ApplicationController
  respond_to :json

  def create
    food = Food.find(params[:food_id])
    if food
      params[:properties].each do |property|
        food.properties.create(property)
      end
    end
    respond_with food, :location => "/"
  end
end
