# frozen_string_literal: true

class BillsCreation
  include UseCase
  include ActionView::Helpers::NumberHelper

  attr_reader :enrollment, :due_date

  def initialize(enrollment)
    @enrollment = enrollment
  end


  def perform
    create_bills
  end

  def create_bills
    enrollment.installments.times do |count|
      Bill.create(enrollment_id: enrollment.id, amount: calculate_bill_amount, due_date: get_due_date_by_day + count.months, status: 'open')
    end
  end

  def calculate_bill_amount
    number_with_precision(enrollment.amount / enrollment.installments, precision: 2)
  end

  def get_due_date_by_day
    due_date ||= Date.new(Date.today.year, Date.today.month, enrollment.due_day)
    due_date <= Date.today ? due_date + 1.month : due_date
  end
end
