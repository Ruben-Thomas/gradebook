class StudentsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_student
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.user_type = 2
    if @student.save
      redirect_to students_path, notice: 'student was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @current_user.update(student_params)
      redirect_to students_path, notice: 'Password successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  def index
  end

  private
    def student_params
      params.require(:student).permit( :name, :email, :password, :teacher_id)
    end

    def authenticate_student
      if session[:user_type] == 2
        return true
      else
        flash[:error] = 'Students Only'
        redirect_to login_path
        return false
      end
    end
end
