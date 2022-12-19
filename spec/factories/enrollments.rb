# frozen_string_literal: true

FactoryBot.define do
  factory :enrollment do
    amount { 1_200_000 }
    installments { 3 }
    due_day { 5 }
    student
  end
end
