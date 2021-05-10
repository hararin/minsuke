class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|

      t.integer :user_id, null: false
      t.integer :participant_id, null: false
      t.integer :evaluation, null: false
      t.text :content

      t.timestamps
    end
  end
end
