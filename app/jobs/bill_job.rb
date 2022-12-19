# frozen_string_literal: true

class BillJob < ApplicationJob
  queue_as :default

  def perform(bill)
    binding.pry
    return if bill.open_or_pending?

    return if bill.created_at > Date.today

    bill.update_status
  end
end
