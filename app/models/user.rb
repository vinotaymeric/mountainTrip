class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:facebook]
  mount_uploader :picture, PictureUploader
  has_many :trips, dependent: :destroy
  has_many :user_trips
  has_many :messages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :user_name, presence: true

  def avatar
    if picture.file
      return picture
    elsif facebook_picture_url
      return facebook_picture_url
    else
      return "https://loremflickr.com/320/320?lock=1"
    end
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params[:user_name] = auth.info[:first_name]
    user_params[:email] = auth.info[:email]
    # user_params[:picture] = user_params[:facebook_picture_url]
    p
    p
    p user_params[:picture]
    user_params = user_params.to_h
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
