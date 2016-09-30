class CreateStreamers < ActiveRecord::Migration[5.0]
  def change
    create_table :streamers do |t|
      t.column :name, :string
      t.column :logo, :string
      t.column :channel_name, :string
      t.column :is_live, :boolean, default: false
    end
  end
end
