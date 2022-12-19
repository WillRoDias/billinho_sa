# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.page(params[:page]).per(params[:count])
    render json: { page: params[:page], count: params[:count], items: @students }, status: 200
  end

  def create
    student = StudentsCreation.new(student_params).perform
    if student
      render json: { id: student.id }
    else
      render json: student, status: 422
    end
  end

  private

  def student_params
    params.permit(:name, :cpf, :birthdate, :payment_method)
  end
end
