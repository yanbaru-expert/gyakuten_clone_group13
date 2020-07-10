class PostsController < InheritedResources::Base

  def create
    @post = Post.new(post_params)
     #追記した部分ここから
    url = params[:post][:url]
    url = url.last(11)
    @post.url = url
    #ここまで

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  private

    def post_params
      params.require(:post).permit(:title, :url)
    end

end
