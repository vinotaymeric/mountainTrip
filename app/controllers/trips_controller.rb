class TripsController < ApplicationController
 

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

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
    redirect_to trips_path
  end

  def edit
    # TODO
  end

  def update
    # TO DO
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date)
  end
end
