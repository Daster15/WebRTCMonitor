class SdpsExtend < ActiveRecord::Migration[6.1]
  def change
    change_column :sdps, :session, :integer ,:limit => 8 
    change_column :sdps, :handle, :integer ,:limit => 8 
  end
end
