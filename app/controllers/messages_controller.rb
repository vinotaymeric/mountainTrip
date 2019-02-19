class MessagesController < ApplicationController

  def new
    @message = Message.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @message = Message.new(message_params)
    @message.trip = Trip.find(params[:trip_id])
    # # Lignes dessous à modifier quand le login fonctionnera
    # @trip.user = current_user
    @message.user = User.find(4)
    @message.save!
    redirect_to trips_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

