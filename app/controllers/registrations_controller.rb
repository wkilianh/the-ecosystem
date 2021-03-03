class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    profile_path(current_user) # '/an/example/path' # Or :prefix_to_your_route
  end

  def after_update_path_for(resource) # only works when coming from the users page controller!
    profile_path(current_user)
  end
end
