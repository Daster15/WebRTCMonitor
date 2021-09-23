class Ice < ActiveRecord::Migration[6.1]
  def change
    create_table :ice do |t|
      t.integer :session
      t.integer :handle
      t.integer :stream
      t.integer :component
      t.string :state
      t.timestamp :timestamp
    end
  end
end
