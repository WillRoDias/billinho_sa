require 'rails_helper'

RSpec.describe "StudentsController", type: :request do
    context "routes works" do
        it "GET /students route works!" do
            get "/students"
            expect(response).to have_http_status(200)
        end
        it "POST /students route works!" do
            params = {
                name: "Novo aluno",
                cpf: "038.347.910-08",
                birthdate: "23/10/1996",
                payment_method: "boleto"
              }
            post "/students", params: params
            expect(response).to have_http_status(200)
        end
    end
end