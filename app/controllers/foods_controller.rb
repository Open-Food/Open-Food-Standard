class FoodsController < ApplicationController
  respond_to :json

  def index
    @foods = Food

    if name = params[:name]
      @foods = @foods.where("name LIKE ?", "%#{name}%")
    end

    respond_with @foods.page(params[:page]).per(25)
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
    respond_with Food.where(:uuid => params[:id]).first
  end
end
