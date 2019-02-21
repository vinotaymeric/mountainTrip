class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: :home
    
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :userAvatar
    before_action :configure_permitted_parameters, if: :devise_controller?


     protected

          def configure_permitted_parameters

              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :email, :password, :picture)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_name, :email, :password, :current_password, :picture)}
          end


          def userAvatar
            @user = current_user
          end
end
