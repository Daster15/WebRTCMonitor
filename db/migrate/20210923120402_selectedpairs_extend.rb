class SelectedpairsExtend < ActiveRecord::Migration[6.1]
  def change
    change_column :selectedpairs, :session, :integer ,:limit => 8 
    change_column :selectedpairs, :handle, :integer ,:limit => 8 
  end
end
