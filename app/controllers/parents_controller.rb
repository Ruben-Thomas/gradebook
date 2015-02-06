class ParentsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_parent

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    @parent.user_type = 3
    if @parent.save
      redirect_to parents_path, notice: 'parent was successfully created.'
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
    def parent_params
      params.require(:parent).permit( :name, :email, :password, :student_id)
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
end
