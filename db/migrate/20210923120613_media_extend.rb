class MediaExtend < ActiveRecord::Migration[6.1]
  def change
    change_column :media, :session, :integer ,:limit => 8 
    change_column :media, :handle, :integer ,:limit => 8 
  end
end
