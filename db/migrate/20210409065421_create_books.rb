class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :category
      t.decimal :price, precision: 3, scale: 2

      t.timestamps
    end
  end
end
