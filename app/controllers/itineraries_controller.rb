class ItinerariesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @itineraries = Itinerary.all
    @markers = @itineraries.map do |itinerary|
      {
        lng: itinerary[:coord_long],
        lat: itinerary[:coord_lat],
        infoWindow: render_to_string(partial: "infowindow", locals: { itinerary: itinerary })
      }
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end
end
