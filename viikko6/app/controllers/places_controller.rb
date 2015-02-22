class PlacesController < ApplicationController
  def index
  end

  def show
    places = BeermappingApi.places_in(session[:last_place])
    places.each do |p|
      if p.id == params[:id]
        @place = p
      end
    end
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    session[:last_place] = params[:city]
    if @places.empty?
      redirect_to :back, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end
end