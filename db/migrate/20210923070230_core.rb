class Core < ActiveRecord::Migration[6.1]
  def change
    create_table :core do |t|
      t.string :name
      t.string :value
      t.timestamp :timestamp
    end
  end
end
