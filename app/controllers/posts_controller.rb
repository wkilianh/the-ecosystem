class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :search]

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
    if @post.update(post_params)
      redirect_to posts_path
      flash.alert = "Post updated!"
    else
      render :new
    end

  end

  def index
    @posts = policy_scope(Post).order(created_at: :desc)
  end

  def search

    @posts = Post.all

    if params[:query].present?
      @posts = Post.search_post(params[:query])
    end

    # here we filter on category if category is supplied
    if params[:category].present? && params[:category] != "all"
      @posts = @posts.where(category: params[:category])
    end

    if params[:ratings].present?
      @posts = @posts.order(params[:ratings] => "desc")
    end


    authorize @posts
    return @posts

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
                                :expect_resources, :expect_diyeffort, :expect_ecocost, :category, :topic)
  end


end
