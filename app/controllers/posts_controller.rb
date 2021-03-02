class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:rich_body)
  end


end
