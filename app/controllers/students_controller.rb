# frozen_string_literal: true

class StudentsController < ApplicationController
  # before_action :set_student

  def index
    @students = Student.all
    # if @students.any?
    #     response json: @students, status: 200
    # else
    #     response json: {status: 406}
    # end
    render json: @students
  end

  def create
    @student = Student.new(student_params)
    @student.save
    render json: @student
    # if @student.save
    #     response json: @student, status: 201
    # else
    #     response json: @student.errors, status: 422
    # end
  end

  def show
    if @student_each
      render json: @student_each
    else
      render json: @student_each.errors, status: 406
    end
  end

  def update
    if @student_each.update(student_params)
      render json: @student_each
    else
      render json: @student_each.errors, status: 422
    end
  end

  def destroy
    @student_each.destroy
  end

  private

  def set_student
    @student_each = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :cpf, :birthdate, :payment_method)
  end
end
