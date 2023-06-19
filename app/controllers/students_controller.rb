class StudentsController < ApplicationController

  def index
    if params[:q].present?
      students = Student.where("first_name LIKE :query OR last_name LIKE :query", query: "%#{params[:q]}%")
    else
      students = Student.all
    end
  
    render json: students
  end
  
  def show
    student = Student.find(params[:id])
    render json: student
  end
  
end
