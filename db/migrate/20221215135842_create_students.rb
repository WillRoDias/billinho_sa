# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.date :birthdate
      t.string :payment_method, null: false

      t.timestamps
    end
  end
end
