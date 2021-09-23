class Sessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.integer :session
      t.string :event
      t.timestamp :timestamp
    end
  end
end
