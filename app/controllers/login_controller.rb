class LoginController < ApplicationController
  def new

  end

  def create
    user = find_teacher || find_student || find_parent
    if user && user.authenticate(params[:login][:password])
      make_session(user)
      if session[:user_type] == 1
        redirect_to teachers_path
      elsif session[:user_type] == 2
        redirect_to students_path
      elsif session[:user_type] == 3
        redirect_to parents_path
      end
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_type] = nil
    @current_user = nil
    flash[:error] = 'Logged Out'
    render 'new'
  end
  private

    def make_session(user)
      session[:user_id] = user.id
      session[:user_type] = user.user_type
    end

end
