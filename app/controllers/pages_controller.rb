class PagesController < ApplicationController
  layout false
  def home
    #@trips = Trip.order('trips.created_at desc').limit(6)
    @trips = Trip.order('trips.start_date asc').limit(6)
    @user = current_user
  end

  def profil
    @user = current_user
  end
end
