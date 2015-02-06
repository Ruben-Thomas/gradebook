class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

    protected
    def authenticate_user
      if session[:user_id]
        @current_user = Teacher.find(session[:user_id]) || Student.find(session[:user_id]) || Parent.find(session[:user_id])
        return true
      else
        flash[:error] = 'Please Log In'
        redirect_to login_path
        return false
      end
    end

    def find_teacher
      Teacher.find_by(email: params[:login][:email].downcase)
    end

    def find_student
      Student.find_by(email: params[:login][:email].downcase)
    end

    def find_parent
      Parent.find_by(email: params[:login][:email].downcase)
    end
end
