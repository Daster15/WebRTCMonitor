class SessionsExtend < ActiveRecord::Migration[6.1]
  def change
    change_column :sessions, :session, :integer ,:limit => 8 
  end
end
