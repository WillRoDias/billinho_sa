class Enrollment < ApplicationRecord

  belongs_to :student
  has_many :bills

  validates :student_id, presence: true
  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :installments, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :due_day, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 31}

  after_commit :create_bills

  def create_bills
    @bills = BillsCreation.new(self)
    @bills.perform
  end
end
