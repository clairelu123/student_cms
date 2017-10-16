class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    # find_course
    # @students = Student.where(:course_id => @course.id)
    @student = Student.find(params[:id])
    @courses = @student.courses
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params.require(:student).permit(:snum, :name, :email ))
    if @student.save
      flash[:notice] = "Student created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(params.require(:student).permit(:snum, :name, :email))
      flash[:notice] = "Student updated successfully."
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @student = Student.find(params[:id])
  end

  def destroy
    student = Student.find(params[:id]).destroy
    flash[:notice] = "Student '#{student.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

    def find_course
      if params[:subject_id]
        @course = Course.find(params(:course_id))
      end
    end
end
