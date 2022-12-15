# frozen_string_literal: true

class BillsCreation
  include UseCase
  include ActionView::Helpers::NumberHelper

  attr_reader :enrollment, :enrollment_id, :installments, :amount, :due_day, :due_date

  def initialize(enrollment)
    @enrollment = enrollment
  end

  def perform
    # validate!
    calculate_bill_amount
    get_due_date_by_day
    create_bills
  end

  def validate!
    raise 'no enrollment found' if !Enrollment.find(enrollment_id)
  end

  def calculate_bill_amount
    number_with_precision(enrollment.amount / enrollment.installments, precision: 2)
  end

  def get_due_date_by_day
    @due_date = Date.new(Date.today.year, Date.today.month, enrollment.due_day)
    if due_date <= Date.today
      return  due_date + 1.month
    else
      return due_date
    end
  end

  def create_bills
    enrollment.installments.times do
      status = "aberta"
      bill = Bill.new(enrollment_id: enrollment.id, due_date: get_due_date_by_day, status: status)
      bill.save!
    end
  end

  def bill_due_date
    current_month = due_date.month
  end
end
