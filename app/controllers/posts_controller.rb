class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

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

    if params[:query].present?
     @posts = policy_scope(Post).search(params[:query])
     else
     @posts = policy_scope(Post)
    end

    if params[:Category] == "all"
      @posts = policy_scope(Post)
    else
      @posts = @posts.where(category: params[:Category])
    end

  end

  def show
    @rating = Rating.new
    @reply = Reply.new
    @post = Post.find(params[:id])
    @comment = Comment.new
    @conversation = Conversation.new
    # authorize @comment
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
    params.require(:post).permit(:rich_body, :title, :photos, :expect_co2, :expect_waste,
                                :expect_resources, :expect_diyeffort, :expect_ecocost, :category)
  end


end
