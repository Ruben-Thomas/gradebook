class StudentsController < ApplicationController
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
  end

  def destroy
  end

  def index
  end

  private
    def student_params
      params.require(:student).permit( :name, :email, :password, :teacher_id)
    end
end
