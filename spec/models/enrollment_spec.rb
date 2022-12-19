# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  context 'it works!' do
    it 'creates enrollment and bills' do
      student = FactoryBot.create(:student)
      enrollment = Enrollment.create(student_id: student.id, installments: 5, amount: 1_200_000, due_day: 5)
      expect(enrollment).to be_valid
      expect(enrollment.amount).to be_present
      expect(enrollment.student_id).to be_present
      expect(enrollment.installments).to be_present
      expect(enrollment.due_day).to be_present
      expect(enrollment.bills).to be_present
    end
  end
  context 'params missing' do
    it 'student_id missing' do
      enrollment = Enrollment.create(student_id: nil, installments: 5, amount: 1_200_000, due_day: 5)
      expect(enrollment.errors[:student_id]).to include("can't be blank")
    end
    it 'other params missing' do
      enrollment = Enrollment.create(student_id: nil, installments: nil, amount: nil, due_day: nil)
      expect(enrollment.errors).to include("can't be blank")
    end
  end
end
