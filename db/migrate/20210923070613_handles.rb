class Handles < ActiveRecord::Migration[6.1]
  def change
    create_table :handles do |t|
      t.integer :session
      t.integer :handle
      t.string :event
      t.string :plugin
      t.timestamp :timestamp
    end
  end
end
