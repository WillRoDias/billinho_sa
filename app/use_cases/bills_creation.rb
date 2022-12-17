# frozen_string_literal: true

class BillsCreation
  include UseCase
  include ActionView::Helpers::NumberHelper

  attr_reader :enrollment, :enrollment_id, :installments, :amount, :due_day, :due_date

  def initialize(enrollment)
    @enrollment = enrollment
  end


  def perform
    calculate_bill_amount
    get_due_date_by_day
    create_bills
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
    month_aux = 0
    enrollment.installments.times do
      due_date = get_due_date_by_day + month_aux.month
      status = "aberta"
      bill = Bill.new(enrollment_id: enrollment.id, amount: calculate_bill_amount, due_date: due_date, status: status)
      bill.save
      month_aux += 1
    end
  end

  def calculate_due_date
    
    due_date = get_due_date_by_day + month_aux.months
    month_aux += 1
  end

  def bill_due_date
    current_month = due_date.month
  end
end
