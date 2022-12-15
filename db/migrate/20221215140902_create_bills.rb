# frozen_string_literal: true

class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.integer :amount
      t.date :due_date
      t.string :status

      t.timestamps
    end
  end
end
