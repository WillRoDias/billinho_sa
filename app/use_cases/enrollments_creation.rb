class EnrollmentsCreation
    include UseCase

    attr_reader :enrollments_params, :amount

    def initialize(enrollments_params)
        @enrollments_params = enrollments_params
        @amount = enrollments_params[:amount]
    end

    def perform
        create_enrollment
    end

    def create_enrollment
        enrollment = Enrollment.new(enrollments_params)
        enrollment.save ? enrollment : enrollment.errors
    end
end