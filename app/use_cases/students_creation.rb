class StudentsCreation
    include UseCase

    attr_reader :student_params

    def initialize(student_params)
        @student_params = student_params
    end

    def perform
        return create_student
    end

    def create_student
        @student = Student.create(student_params)
        return @student
    end
end