class ThingsController < ApplicationController
  respond_to :json

  def index
    name = params[:name]

    if name
      @things = Thing.where(:name => name)
    else
      @things = Thing.limit(10)
    end

    respond_with @things
  end

  def create
    thing = Thing.create(params[:thing])
    respond_with thing, :location => "/"
  end
end
