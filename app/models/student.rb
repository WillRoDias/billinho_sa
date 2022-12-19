# frozen_string_literal: true

class Student < ApplicationRecord
  has_many :enrollment

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :payment_method, presence: true, inclusion: { in: %w[boleto credit_card] }
end
