class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :title, null: false
      t.text :address, null: false
      t.text :city, null: false
      t.timestamp :start_time, null: false
      t.timestamp :end_time
      t.text :topics, array: true, default: []
      t.timestamps
    end
    add_index :events, [:city, :start_time]
    add_index :events, :topics, using: :gin
  end
end
