class ThingsController < ApplicationController
  respond_to :json

  def index
    keywords = params[:keywords]

    if keywords
      @things = Thing.where(:name => keywords)
    else
      @things = Thing.limit(10)
    end

    respond_with @things
  end
end
