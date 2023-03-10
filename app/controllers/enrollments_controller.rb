# frozen_string_literal: true

class EnrollmentsController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: 'admin_ops', password: 'billing', only: [:create]

  def index
    @enrollments = Enrollment.page(params[:page]).per(params[:count])
    render json: @enrollments.to_json(include: :bills)
  end

  def create
    enrollment = EnrollmentsCreation.new(enrollments_params).perform
    if enrollment
      render json: enrollment.to_json(include: :bills), status: 202
    else
      render json: enrollment.errors, status: 422
    end
  end

  private

  def enrollments_params
    params.permit(:student_id, :amount, :installments, :due_day)
  end
end
