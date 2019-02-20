class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
    @markers = @itineraries.map do |itinerary|
      {
        lng: itinerary[:coord_long],
        lat: itinerary[:coord_lat],
        infoWindow: render_to_string(partial: "infowindow", locals: { itinerary: itinerary }),
        image_url: helpers.asset_url('https://png.pngtree.com/svg/20170116/mountain__1201096.png')
      }
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end
end
