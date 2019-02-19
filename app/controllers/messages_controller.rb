class MessagesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @messages = Message.where(trip_id: @trip.id)
    @message = Message.new
  end

  def new
    @message = Message.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @message = Message.new(message_params)
    @message.trip = Trip.find(params[:trip_id])
    @message.user = current_user
    @message.save!
    redirect_to trip_messages_path
  end

  def update
    Message.update(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
