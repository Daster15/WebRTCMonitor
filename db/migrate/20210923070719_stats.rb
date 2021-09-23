class Stats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.integer :session
      t.integer :handle
      t.string :medium
      t.integer :base
      t.integer :lsr
      t.integer :lostlocal
      t.integer :lostremote
      t.integer :jitterlocal
      t.integer :jitterremote
      t.integer :packetssent
      t.integer :packetsrecv
      t.integer :bytessent
      t.integer :bytesrecv
      t.integer :nackssent
      t.integer :nacksrecv
      t.timestamp :timestamp
    end
  end
end
