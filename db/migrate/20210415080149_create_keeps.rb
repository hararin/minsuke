class CreateKeeps < ActiveRecord::Migration[5.2]
  def change
    create_table :keeps do |t|
      t.integer :user_id, null: false
      t.integer :request_id, null: false

      t.timestamps
    end
  end
end
