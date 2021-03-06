class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index || :search, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index || :search, unless: :skip_pundit?

  # after_action :verify_authorized, except: :search, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :serch, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :level, :prof_pic, :conversation_channel])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :level, :prof_pic, :conversation_channel])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
