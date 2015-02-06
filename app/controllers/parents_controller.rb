class ParentsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_parent, except: [:new, :create, :destroy]
  before_action :authenticate_teacher, only: [:new, :create, :destroy]
  before_action :set_parent, only: [:destroy]

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    @parent.user_type = 3
    if @parent.save
      redirect_to teachers_path, notice: 'parent was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @current_user.update(parent_params)
      redirect_to parents_path, notice: 'Password successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @parent.destroy
    redirect_to teachers_path, notice: 'Parent successfully removed.'
  end

  def index
  end

  private
    def parent_params
      params.require(:parent).permit( :name, :email, :password, :student_id)
    end

    def set_parent
      @parent = Parent.find(params[:id])
    end

    def authenticate_parent
      if session[:user_type] == 3
        return true
      else
        flash[:error] = 'Parents Only'
        redirect_to login_path
        return false
      end
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
