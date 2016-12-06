class AddStreamerToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :streamer_id, :int
  end
end
