class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    @posts = Post.all
  end

  def index
    # @posts = Post.all
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

end
