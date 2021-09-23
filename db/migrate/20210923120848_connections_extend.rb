class ConnectionsExtend < ActiveRecord::Migration[6.1]
  def change
    change_column :connections, :session, :integer ,:limit => 8 
    change_column :connections, :handle, :integer ,:limit => 8 
  end
end
