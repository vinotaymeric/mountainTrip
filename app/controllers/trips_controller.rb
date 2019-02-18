class TripsController < ApplicationController
 

  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @trip = Trip.new
    @trip.itinerary = @itinerary
    # # Ligne dessous à modifier quand le login fonctionnera
    @trip.user = current_user
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.save
    # TO DO :redirect somewhere
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date)
  end
end
