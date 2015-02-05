class ParentsController < ApplicationController
  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
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
end
