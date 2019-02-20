class UserTripsController < ApplicationController

  def create
    @request = UserTrip.new
    @request.user = current_user
    @trip = Trip.find(params[:trip_id])
    @request.trip = @trip
    @request.state = "demandé"
    if @request.save!
      redirect_to trip_messages_path(@trip)
      flash[:notice] = "Demande envoyée. Montrez que vous êtes sympa, vos seins, etc."
    end
  end

  def accept
    @request = UserTrip.find(params[:id])
    if @request.update!(state: "accepté")
      redirect_to my_trips_path
      flash[:notice] = "Copain validé!"
    end
  end

  def decline
    @request = UserTrip.find(params[:id])
    if @request.update!(state: "refusé")
      redirect_to my_trips_path
      flash[:notice] = "Copain refusé!"
    end
  end

  private

  def user_trip_params
    params.require(:user_trip).permit(:state)
  end
end
