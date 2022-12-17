class BillJob < ApplicationJob
  queue_as :default

  # attr_reader :bill

  # def initialize(bill)
  #   @bill = bill
  # end

  def perform(bill)
    binding.pry
    return if bill.open_or_pending?

    return if bill.created_at > Date.today
    
    bill.update_status
  end
end
