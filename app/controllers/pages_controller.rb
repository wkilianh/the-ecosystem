class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    # @posts = Post.all
    @posts = Post.all.order(created_at: :desc)
  end

  # def index
  #   # @posts = Post.all
  # end


end
