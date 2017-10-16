class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @enrolls = @course.enrolls
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params.require(:course).permit(:name, :description))
    if @course.save
      flash[:notice] = "Course created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params.require(:course).permit(:name, :description))
      flash[:notice] = "Course updated successfully."
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @course = Course.find(params[:id])
  end

  def destroy
    course = Course.find(params[:id]).destroy
    flash[:notice] = "Course '#{course.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end
end
