class EnrollmentsCreation
    include UseCase

    attr_reader :enrollments_params

    def initialize(enrollments_params)
        @enrollments_params = enrollments_params
    end

    def perform
        create_enrollment
    end

    def create_enrollment
        enrollment = Enrollment.new(enrollments_params)
        enrollment.save ? enrollment : enrollment.errors
    end
end