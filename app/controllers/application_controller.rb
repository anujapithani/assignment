class ApplicationController < ActionController::Base
    def current_admin
        @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
    end
    helper_method :current_admin
end
