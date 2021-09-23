class Transports < ActiveRecord::Migration[6.1]
  def change
    create_table :transports do |t|
      t.integer :session
      t.integer :handle
      t.string :plugin
      t.string :event
      t.timestamp :timestamp
    end
  end
end
