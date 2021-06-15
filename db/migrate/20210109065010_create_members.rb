class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.uuid :external_id, default: 'gen_random_uuid()', null: false
      t.timestamps
    end
  end
end
