class Connections < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.integer :session
      t.integer :handle
      t.string :state
      t.timestamp :timestamp
    end
  end
end
