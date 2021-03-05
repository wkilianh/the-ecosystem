class RatingsController < ApplicationController
  def create
    authorize @rating
  end
end
