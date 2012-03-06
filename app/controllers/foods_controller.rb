class FoodsController < ApplicationController
  respond_to :json

  def index
    name = params[:name]

    if name
      @foods = Food.where("name LIKE ?", "%#{name}%")
    else
      @foods = Food.limit(10)
    end

    respond_with @foods
  end
  
  def new
    respond_with Food.new
  end
  
  def create
    food = Food.create!(params[:food].slice(:name))
    if params[:food][:properties]
      params[:food][:properties].each do |property|
        food.properties.create(:name => property[:name], :value => property[:value])
      end
    end
    respond_with food, :location => "/"
  end

  def show
    respond_with Food.find(params[:id])
  end  
      
end
