class Selectedpairs < ActiveRecord::Migration[6.1]
  def change
    create_table :selectedpairs do |t|
      t.integer :session
      t.integer :handle
      t.integer :stream
      t.integer :component
      t.string :selected
      t.timestamp :timestamp
    end
  end
end
