class Sdps < ActiveRecord::Migration[6.1]
  def change
    create_table :sdps do |t|
      t.integer :session
      t.integer :handle
      t.boolean :remote
      t.boolean :offer
      t.string :sdp
      t.timestamp :timestamp
    end
  end
end
