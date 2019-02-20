class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
    p @itineraries
    @markers = @itineraries.map { |itinerary| { lng: itinerary[:coord_long], lat: itinerary[:coord_lat] } }
    p @markers
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end
end
