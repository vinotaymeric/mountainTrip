class PagesController < ApplicationController
  def home
    @trips = Trip.last(6)

  end
end
