class ItinerariesController < ApplicationController
  def index

    if params[:address].present? && params[:activity].present?
      @itineraries = Itinerary.near(params[:address], 100)
      @itineraries.select { |itinerary| itinerary.activities.include?(params[:activity]) }
    else
      @itineraries = Itinerary.all
    end

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
