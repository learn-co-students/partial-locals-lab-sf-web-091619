class StudentsController < ApplicationController
  before_action :find_student, only: [:edit, :show]

  def index
    @students = Student.search(params[:query])

  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  private

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown, :query)
  end
  
  def find_student
    @student = Student.find(params[:id])
  end


end
