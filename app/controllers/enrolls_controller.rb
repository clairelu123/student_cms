class EnrollsController < ApplicationController
  def index
    @enrolls = Enroll.all
  end

  def show
    @enroll = Enroll.find(params[:id])

  end

  def new
    @enroll = Enroll.new
  end

  def create
    @enroll = Enroll.new(params.require(:enroll).permit(:student_id, :course_id))
    if @enroll.save
      flash[:notice] = "enroll created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end


  def edit
    @enroll = Enroll.find(params[:id])
  end

  def update
    @enroll = Enroll.find(params[:id])

    if @enroll.update_attributes(params.require(:enroll).permit(:grade))
      flash[:notice] = "enroll updated successfully."
      redirect_to(:action => 'index')
      # redirect_to()
    else
      render('edit')
    end
  end
  # def update
  #   @course = Course.find(params[:id])
  #
  #   if @course.update_attributes(params.require(:course).permit(:name, :description))
  #     flash[:notice] = "Course updated successfully."
  #     redirect_to(:action => 'index')
  #   else
  #     render('edit')
  #   end
  # end

  def delete
    @enroll = Enroll.find(params[:id])
  end

  def destroy
    enroll = Enroll.find(params[:id]).destroy
    # flash[:notice] = "Course '#{course.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end
end
