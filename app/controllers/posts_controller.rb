class PostsController < ApplicationController
  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    if @post.save
      redirect_to root_path
    else
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:rich_body)
  end


end
