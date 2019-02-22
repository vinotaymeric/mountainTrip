require 'nokogiri'
require 'open-uri'

class TripsController < ApplicationController
  before_action :init_mark_down_parser, only: :show

  def index
    if params[:activity].present?
      @trips = Trip.all.order('trips.created_at desc').select { |trip| trip.itinerary.activities.include?(params[:activity]) }
    else
      @trips = Trip.all.order('trips.created_at desc')
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @user_trip = UserTrip.new
    @users = @trip.user_trips.where(state: "accepté").map { |user_trip| user_trip.user }
    @message = Message.new
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

  def my_trips
    @my_trips = Trip.where(user_id: current_user.id).order('trips.created_at desc')

    #    .first
  end

  # def validate_user_for_trip
  #   @trip = Trip.find(params[:id])
  #   @trip.user_trip = UserTrip.create(user: current_user, trip: @trip, accepted: true)
  #   @trip.save
  # end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :title)
  end

  def sign_up_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

  def init_mark_down_parser
    renderer = Redcarpet::Render::HTML.new(no_images: true)
    @markdown = Redcarpet::Markdown.new(renderer)
  end
end
