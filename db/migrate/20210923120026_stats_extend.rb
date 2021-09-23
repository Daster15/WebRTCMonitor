class StatsExtend < ActiveRecord::Migration[6.1]
  def change
    change_column :stats, :session, :integer ,:limit => 8 
    change_column :stats, :handle, :integer ,:limit => 8 
    change_column :stats, :bytessent, :integer ,:limit => 8 
    change_column :stats, :bytesrecv, :integer ,:limit => 8 
    change_column :stats, :nackssent, :integer ,:limit => 8 
    change_column :stats, :nacksrecv, :integer ,:limit => 8 
  end
end
