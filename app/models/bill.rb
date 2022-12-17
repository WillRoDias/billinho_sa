# frozen_string_literal: true

class Bill < ApplicationRecord
  belongs_to :enrollment

  validates :amount, presence: true
  validates :due_date, presence: true
  validates :status, presence: true

  def mark_as_pending
    status: :pending
  end
  
  def mark_as_paid
    status: :paid
  end
end
