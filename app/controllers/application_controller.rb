class ApplicationController < ActionController::Base
  before_action :verify_user_steps!

  def verify_user_steps!
    return if devise_controller?
    return unless user_signed_in?
    return if current_user.first_name && current_user.last_name
    redirect_to after_signup_path(:terms)
  end

end
