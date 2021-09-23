class Plugins < ActiveRecord::Migration[6.1]
  def change
    create_table :plugins do |t|
      t.integer :session
      t.integer :handle
      t.string :plugin
      t.string :event
      t.timestamp :timestamp
      t.string :call_id 
      t.string :username
      t.string :callee 
      t.string :call_type
    end
  end
end
