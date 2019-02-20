class UserTrip < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  validates :user_id, presence: true
  validates :trip_id, presence: true

  after_create :create_default_message

  attr_accessor :default_message

  private

  def create_default_message
    if !default_message.nil?
      message = Message.new
      message.user = user
      message.trip = trip
      message.content = default_message
      message.save!
    end
  end
end
