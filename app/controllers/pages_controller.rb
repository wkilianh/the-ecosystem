class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    @posts = Post.all
  end

  def index
  end

end
