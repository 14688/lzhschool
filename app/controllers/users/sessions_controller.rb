class Users::SessionsController < Devise::SessionsController
   #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
  	super do |resource|
  	end	
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  #登陆成功后跳转至学校
    def after_sign_in_path_for(resource)
  	   schools_path
    end 

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
