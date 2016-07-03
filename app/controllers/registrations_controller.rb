class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :user_type, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :user_type, :email, :password, :password_confirmation, :current_password)
  end

  protected

  def after_sign_up_path_for(resource)
    home_dashboard_path
  end
end