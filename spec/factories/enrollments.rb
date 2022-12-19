FactoryBot.define do
  factory :enrollment do
    amount {1200000}
    installments {3}
    due_day {5}
    student
  end
end
