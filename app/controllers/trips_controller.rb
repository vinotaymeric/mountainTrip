require 'nokogiri'
require 'open-uri'


class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
    @trip.itinerary = @itinerary
    @trip.user = current_user
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.save
    @trip.itinerary = Itinerary.find(params[:itinerary_id])
    @trip.user = current_user
    @trip.save!
    redirect_to trips_path
  end

  def validate_user_for_trip
    @trip = Trip.find(params[:id])
    @trip.user_trip = UserTrip.create(user: current_user, trip: @trip, accepted: true)
    @trip.save
  end

  def get_weather_for_trip
    itinerary = Trip.find(params[:id]).itinerary
    url = 'https://api.github.com/users/ssaunier'

  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :title)
  end

  def sign_up_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end
