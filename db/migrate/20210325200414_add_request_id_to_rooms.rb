class AddRequestIdToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :request_id, :integer
  end
end
