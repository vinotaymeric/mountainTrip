class TripsController < ApplicationController


  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
<<<<<<< HEAD
    @trip.itinerary = @itinerary
    @trip.user = current_user
=======
    @itinerary = Itinerary.find(params[:itinerary_id])
>>>>>>> 38373390319f9c2a7f012a3cd0a123218afdf8a1
  end

  def create
    @trip = Trip.new(trip_params)
<<<<<<< HEAD
    @trip.user = current_user
    @trip.save
=======
    @trip.itinerary = Itinerary.find(params[:itinerary_id])
    # # Lignes dessous à modifier quand le login fonctionnera
    # @trip.user = current_user
    @trip.user = User.find(4)
    @trip.save!
>>>>>>> 38373390319f9c2a7f012a3cd0a123218afdf8a1
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
    params.require(:trip).permit(:start_date, :end_date, :title)
  end
end
