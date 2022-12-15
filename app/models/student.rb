class Student < ApplicationRecord
  has_many :enrollments

  validates :email, presence: true
  validates :cpf, presence: true, uniquiness: true
  validates :payment_method, presence: true
end
