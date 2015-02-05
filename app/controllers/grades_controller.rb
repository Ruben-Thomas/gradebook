class GradesController < ApplicationController
  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to grades_path, notice: 'grade was successfully created.'
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
    def grade_params
      params.require(:grade).permit( :grade, :date, :student_id)
    end
end
