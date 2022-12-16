class BillJob < ApplicationJob
  queue_as :default

  def perform(bill)
    return if bill.open_or_pending?
    
    bill.update_status
  end
end
