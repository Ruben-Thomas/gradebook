class LoginController < ApplicationController
  def new

  end

  def create
    user = find_teacher || find_student || find_parent
    if user && user.authenticate(params[:login][:password])
      make_session(user)
      redirect_to teachers_path
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
    flash[:error] = 'Logged Out'
    render 'new'
  end
  private

    def make_session(user)
      session[:user_id] = user.id
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
