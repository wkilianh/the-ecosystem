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


    if params[:query].present?
      @posts = Post.search_post(params[:query])
    else
      @posts = Post.all.order(created_at: :desc)
    end

    authorize @posts
    return @posts


    if params[:Category] == "all"
      @posts = Post.all
    else
      @posts = Post.all.where(category: params[:Category])
    end


    # if params[:query] == "Rating"
    #    @posts = Post.all.order(rating_avg: :desc)

    # elsif params[:query] == "Views"
    #    @posts = Post.all.order(views_count: :desc)

    # elsif params[:query] == "CO2"
    #    @posts = Post.all.order(expect_co2: :desc)

    # elsif params[:query] == "Waste reduction"
    #    @posts = Post.all.order(expect_waste: :desc)

    # elsif params[:query] == "Resource saving"
    #    @posts = Post.all.order(expect_resources: :desc)

    # elsif params[:query] == "Ease of use"
    #    @posts = Post.all.order(expect_diyeffort: :desc)

    # elsif params[:query] == "Free of side-effects"
    #    @posts = Post.all.order(expect_ecocost: :desc)
    # end

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
