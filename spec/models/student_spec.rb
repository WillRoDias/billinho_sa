# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'it works!' do
    it 'student created' do
      student = FactoryBot.create(:student)
      expect(student).to be_valid
      expect(student.name).to be_present
      expect(student.cpf).to be_present
      expect(student.payment_method).to be_present
    end
  end
  context 'params missing' do
    it "don't create" do
      student = Student.create(cpf: nil)
      student.valid?
      expect(student.errors[:cpf]).to include("can't be blank")
    end
  end
end
