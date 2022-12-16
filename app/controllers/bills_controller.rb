class BillsController < ApplicationController
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    http_basic_authenticate_with name: 'admin', password: 'admin'

    def index
        @bills = Bill.all
        if @bills.any?
            render json: @bills
        else
            render json: @bills.errors
        end
    end

    def create
        @bill = Bill.new(bills_params)
        if @bill.save
            render json: @bill, status: 201
        else
            render json: @bill.errors, status: 422
        end
    end

    def show
        render json: @set_bills
    end

    def update
        @set_bills.update(bills_params)
    end

    def destroy
        set_bills.destroy
    end

    private

    def set_bills
        @bills_each = Bill.find(params[:id])
    end

    def bills_params
        params.require(:bill).permit(:amount, :due_date, :status)
    end
end