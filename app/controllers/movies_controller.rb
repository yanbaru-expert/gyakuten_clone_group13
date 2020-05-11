class MoviesController < ApplicationController

  def index
    if params[:category]
      @movies = Movie.where(category: params[:category]).page(params[:page]).per(10)
    else
      @movies = Movie.where(category: ["Basic", "Git", "Ruby", "Ruby on Rails"]).page(params[:page]).per(10)
    end
  end

  def create

   @post = Post.new(post_params)

   url = params[:post][:youtube_url]
   url = url.last(11)
   @post.youtube_url = url

end

end
