# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :date_of_birth, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
