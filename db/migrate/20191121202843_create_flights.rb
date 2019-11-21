class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :description
      t.datetime :departs_at
      t.integer :user_id
      t.boolean :ten_minute_message_sent
      t.boolean :five_minute_message_sent
      t.boolean :one_minute_message_sent

      t.timestamps
    end
  end
end
