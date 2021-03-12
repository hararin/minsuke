class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|

    	t.integer :user_id, null: false
    	t.datetime :datetime, null: false
    	t.string :address, null: false
    	t.float :latitude
    	t.float :longitude
    	t.string :title, null: false
    	t.text :content
    	t.integer :capacity, null: false
    	t.string :image_id
    	t.datetime :deadline, null: false
    	t.integer :return_status, default: 0, null: false


      t.timestamps
    end
  end
end
