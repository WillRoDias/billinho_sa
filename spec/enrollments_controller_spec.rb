require 'rails_helper'

RSpec.describe "EnrollmentsController", type: :request do
    context "routes works" do
        it "GET /enrollments route works!" do
            get "/enrollments"
            expect(response).to have_http_status(200)
        end
        # let(:student) { Student.create(name: "Novo Aluno") }
        # it "POST /enrollments route works!" do
        #     params = {
        #         amount: 1200000,
        #         installments: 3,
        #         due_day: 5,
        #         student_id: student.id
        #       }
        #     post "/enrollments", params: params
        #     expect(response).to have_http_status(200)
        # end
    end
end