class Enrollment < ApplicationRecord
  belongs_to :student
  has_many :bills

  validates :amount, presence: true
  validates :installments, presence: true
  validates :due_day, presence: true
end
