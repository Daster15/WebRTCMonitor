class Media < ActiveRecord::Migration[6.1]
  def change
    create_table :media do |t|
      t.integer :session
      t.integer :handle
      t.string :medium
      t.boolean :receiving
      t.timestamp :timestamp
    end
  end
end
