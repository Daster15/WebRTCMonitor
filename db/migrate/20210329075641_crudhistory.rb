class Crudhistory < ActiveRecord::Migration[6.1]
  def change
    create_table :crudhistoryactions do |t|
      t.string :action
      t.text :content
      t.integer :user_id
      t.timestamps
    end
  end
end
