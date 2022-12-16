# frozen_string_literal: true

class EnrollmentsController < ApplicationController
# require 'bills.rb'
  # before_action :set_enrollment

  def index
    @enrollments = Enrollment.all
    render json: @enrollments
  end

  def create
    @enrollment = Enrollment.new(enrollments_params)
    @enrollment.save
    create_bills_use_case
    if @enrollment.save && create_bills_use_case
      render json: @enrollment, status: 202
    else
      render json: @enrollment.errors, status: 422
    end
  end

  def show
    render json: @enrollment_each
  end

  def update
    if @enrollment_each.update(enrollments_params)
      render json: @enrollment_each
    else
      render json: @enrollment_each.error, status: 422
    end
  end

  def destroy
    @enrollment_each.destroy
  end

  private

  def create_bills_use_case
      bills = BillsCreation.new(@enrollment)
      bills.perform
  end

  def set_enrollment
    @enrollment_each = Enrollment.find(params[:id])
  end

  def enrollments_params
    params.require(:enrollment).permit(:student_id, :amount, :installments, :due_day)
  end
end
