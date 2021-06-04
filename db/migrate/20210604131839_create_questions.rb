class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|

      t.integer :user_id, null: false
      t.integer :request_id, null: false
      t.text :content, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
