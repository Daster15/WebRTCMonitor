class PluginsExtend < ActiveRecord::Migration[6.1]
  def change
    change_column :plugins, :session, :integer ,:limit => 8 
    change_column :plugins, :handle, :integer ,:limit => 8 
  end
end
