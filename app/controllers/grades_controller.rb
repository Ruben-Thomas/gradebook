class GradesController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_teacher
  before_action :set_grade, except:[:new,:create]
  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to teachers_path, notice: 'grade was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @grade.update(grade_params)
      redirect_to teachers_path, notice: 'Grade successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @grade.destroy
    redirect_to teachers_path, notice: 'Grade successfully removed.'
  end

  def index
  end

  private

    def set_grade
      @grade = Grade.find(params[:id])
    end

    def grade_params
      params.require(:grade).permit( :grade, :date, :student_id)
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
