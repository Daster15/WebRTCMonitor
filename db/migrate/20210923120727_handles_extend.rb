class HandlesExtend < ActiveRecord::Migration[6.1]
  def change
    change_column :handles, :session, :integer ,:limit => 8 
    change_column :handles, :handle, :integer ,:limit => 8 
  end
end
