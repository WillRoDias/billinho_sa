# frozen_string_literal: true

class StudentsCreation
  include UseCase

  attr_reader :student_params

  def initialize(student_params)
    @student_params = student_params
  end

  def perform
    create_student
  end

  def create_student
    student = Student.new(student_params)
    student.save ? student : student.errors
  end
end
