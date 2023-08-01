class ApplicationController < ActionController::Base

    #this is application controller
    helper_method :current_user, :logged_in?
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert]="You must be logged in first"
            redirect_to login_path
        end
    end

    def index
        flash.notice = 'No page found at that address'
        redirect_to root_path
      end
end
