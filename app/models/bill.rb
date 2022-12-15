class Bill < ApplicationRecord
  belongs_to :enrollent_id

  validates :amount, presence: true
  validates :due_date, presence: true
  validates :status, presence: true
end
