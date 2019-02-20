class PagesController < ApplicationController
  def home
    @trips = Trip.last(6)
  end

  def profil
    @user = current_user 
  end
end
