class Enrollment < ApplicationRecord

  belongs_to :student
  has_many :bills

  validates :student_id, presence: true
  validates :amount, presence: true
  validates :installments, presence: true
  validates :due_day, presence: true

  after_commit :create_bills

  def create_bills
    @bills = BillsCreation.new(self)
    @bills.perform
  end
end
