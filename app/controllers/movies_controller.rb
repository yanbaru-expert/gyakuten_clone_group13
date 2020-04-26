class MoviesController < ApplicationController

  def index
    @movies = Movie.where(category: params[:category])
  end

end
