class MoviesController < ApplicationController

  def index
    if params[:category]
      @movies = Movie.where(category: params[:category]).page(params[:page]).per(10)
    else
      @movies = Movie.where(category: ["Basic", "Git", "Ruby", "Ruby on Rails"]).page(params[:page]).per(10)
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    url = params[:movie][:url]
    url = url.last(11)
    @movie.url = url

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie}
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:category, :title, :url)
    end

end
