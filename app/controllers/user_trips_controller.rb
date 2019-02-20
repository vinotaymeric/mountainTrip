class UserTripsController < ApplicationController

  def create
    @request = UserTrip.new
    @request.user = current_user
    @trip = Trip.find(params[:trip_id])
    @request.trip = @trip
    @request.state = "requested"
    if @request.save!
      redirect_to trip_messages_path(@trip)
      flash[:notice] = "Demande envoyée. Montrez que vous êtes sympa, vos seins, etc."
    end
  end

  private

  def user_trip_params
    params.require(:user_trip).permit(:state)
  end
end
