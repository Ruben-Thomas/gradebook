class TeachersController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_teacher

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user_type = 1
    if @teacher.save
      redirect_to teachers_path, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @teachers = Teacher.all
  end

  private
    def teacher_params
      params.require(:teacher).permit( :name, :email, :password)
    end

    def authenticate_teacher
      if session[:user_type] == 1
        return true
      else
        flash[:error] = 'Teachers Only'
        redirect_to login_path
        return false
      end
    end
end
