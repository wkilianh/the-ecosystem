class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    if @post.save
      redirect_to posts_path
      flash.alert = "Post created!"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    @post.update(post_params)
    redirect_to posts_path
    flash.alert = "Post updated!"

  end

  def index
    @posts = policy_scope(Post)
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    flash.alert = "Post deleted!"
    authorize @post
  end

  private

  def post_params
    params.require(:post).permit(:rich_body, :title)
  end


end
