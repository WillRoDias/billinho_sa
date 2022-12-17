# frozen_string_literal: true

class StudentsController < ApplicationController

  def index
    @students = Student.page(params[:page]).per(params[:count])
    render json: {page: params[:page], items: @students}
  end

  def create
    @student = Student.new(student_params)
    if @student.save
        render json: {id: @student.id}, status: 202
    else
        response json: @student.errors, status: 422
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :cpf, :birthdate, :payment_method)
  end
end
