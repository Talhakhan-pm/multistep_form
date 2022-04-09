class AfterSignupController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_user_steps!
  include Wicked::Wizard


  steps :terms, :privacy, :user_information

  def show
    @user = current_user
    case step
    when :terms
      # @terms = Term.find(X)
    when :privacy
    when :user_information
    end

    render_wizard
  end

  def update
    @user = current_user
    @user.update(user_params)
    render_wizard @user
  end 

  private

  def redirect_to_finish_wizard(options, params)
    redirect_to root_path, notice: "Thank you for signing up"
  end


  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
  
end
