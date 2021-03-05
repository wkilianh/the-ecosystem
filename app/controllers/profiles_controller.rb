class ProfilesController < ApplicationController

  def show
    # @user
    @user = User.find(params[:id])
    authorize @user
    # authorize @profile, policy_class: ProfilePolicy # advanced authorization calling
    # authorize current_user, @user, :show?, policy_class: UserPolicy
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    # profile_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:rich_body, :slogan)
  end

end
