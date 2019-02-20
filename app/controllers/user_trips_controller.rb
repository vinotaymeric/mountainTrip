class UserTripsController < ApplicationController

  def create
    @request = UserTrip.new
    @request.user = current_user
    @request.trip = Trip.find(params[:trip_id])
    @request.state = "requested"
    @request.save!
  end

  private

  def user_trip_params
    params.require(:user_trip).permit(:state)
  end
end
