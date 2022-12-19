FactoryBot.define do
  factory :student do
    name {"William"}
    cpf { "123.456.789-10" }
    payment_method {"boleto"}
  end
end
