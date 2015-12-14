class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def require_admin_or_department
      if !user_signed_in?
        redirect_to new_user_session_path
      elsif !(current_user.user_type == "admin" || current_user.user_type == "department")
        redirect_to root_path, notice: "Sorry, you do not have permission to view this page"
      end
    end
  
    def require_admin
      if !user_signed_in?
        redirect_to new_user_session_path
      elsif !(current_user.user_type == "admin")
        redirect_to root_path, notice: "Sorry, you do not have permission to view this page"
      end
    end
end
