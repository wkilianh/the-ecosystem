class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    profile_path(current_user) # '/an/example/path' # Or :prefix_to_your_route
  end
end
