class ProfilesController < ApplicationController

  def show
    # @user
    @user = Post.find(1)
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:rich_body, :slogan)
  end

end
