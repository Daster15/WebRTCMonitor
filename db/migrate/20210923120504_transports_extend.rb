class TransportsExtend < ActiveRecord::Migration[6.1]
  def change
    change_column :transports, :session, :integer ,:limit => 8 
    change_column :transports, :handle, :integer ,:limit => 8 
  end
end
