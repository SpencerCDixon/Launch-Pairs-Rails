class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def update
    super
  end

   def create
     super
     StudentRegistration.new(@user).create_dependencies
   end

  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
