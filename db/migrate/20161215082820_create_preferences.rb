class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.references :user, foreign_key: true, null: false
      t.text :city, null: false
      t.text :topic, null: false
      t.tsrange :start_times, null: false
      t.timestamps
    end
    add_index :preferences, [:city, :topic]
    add_index :preferences, :start_times, using: :gist
  end
end
