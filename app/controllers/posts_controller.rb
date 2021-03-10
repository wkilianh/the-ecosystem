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
    @post.update(post_params)
    redirect_to posts_path
    flash.alert = "Post updated!"

  end

  def index
    @posts = policy_scope(Post)
  end

  def search

    @posts = Post.all

    if params[:category] == "all"

      @posts = Post.all
    else
      @posts = Post.where(category: params[:category])
    end

    if params[:query].present?

      if params[:query] == "CO_2_sort_by_rating"
        @posts = Post.all.joins(:ratings).order("ratings.co2 DESC")

      elsif params[:query] == "waste_sort_by_rating"
        @posts = Post.all.joins(:ratings).order("ratings.waste DESC")

      elsif params[:query] == "resource_sort_by_rating"
        @posts = Post.all.joins(:ratings).order("ratings.resources DESC")

      elsif params[:query] == "diy_sort_by_rating"
        @posts = Post.all.joins(:ratings).order("ratings.diyeffort DESC")

      elsif params[:query] == "cost_sort_by_rating"
        @posts = Post.all.joins(:ratings).order("ratings.ecocost DESC")

      elsif params[:query] == "sort_by_views_count"
        @posts = @posts.order(views_count: :desc)

      elsif params[:query] == "sort_by_avg_rating"
        @posts = @posts.order(rating_avg: :desc)

      else
        @posts = Post.search_post(params[:query])

      end

    else
      @posts = Post.all.order(created_at: :desc)

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
