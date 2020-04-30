class MoviesController < ApplicationController

  def index
    if params[:category]
      @movies = Movie.where(category: params[:category]).page(params[:page]).per(10)
    else
      @movies = Movie.where(category: ["Basic", "Git", "Ruby", "Ruby on Rails"]).page(params[:page]).per(10)
    end
  end

end
