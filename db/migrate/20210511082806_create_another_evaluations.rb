class CreateAnotherEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :another_evaluations do |t|

      t.integer :request_id, null: false
      t.integer :user_id, null: false
      t.integer :evaluation, null: false
      t.text :content

      t.timestamps
    end
  end
end
