class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @itineraries = Itinerary.all
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end
end
