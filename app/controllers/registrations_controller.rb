class RegistrationsController < Devise::RegistrationsController

  def create
    super do
      if resource.save
        StudentRegistration.new(resource).create_dependencies
      end
    end
  end

  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
