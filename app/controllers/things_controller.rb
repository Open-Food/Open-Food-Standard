class ThingsController < ApplicationController
  respond_to :json

  def index
    name = params[:name]

    if name
      @things = Thing.where("name LIKE ?", "%#{name}%")
    else
      @things = Thing.limit(10)
    end

    respond_with @things
  end
  
  def new
    respond_with Thing.new
  end
  
  def create
    thing = Thing.create!(params[:thing].slice(:name))
    if params[:thing][:properties]
      params[:thing][:properties].each do |property|
        thing.properties.create(:name => property[:name], :value => property[:value])
      end
    end
    respond_with thing, :location => "/"
  end

  def show
    respond_with Thing.find(params[:id])
  end  
      
end
