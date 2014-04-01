class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	helper_method :current_user

    def validate_credentials
        redirect_to '/sign_in' if session[:user] == nil
    end

    def current_user
    	return User.find(decrypt(session[:user])) if session[:user] != nil
    end

end
