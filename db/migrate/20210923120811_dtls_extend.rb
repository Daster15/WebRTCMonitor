class DtlsExtend < ActiveRecord::Migration[6.1]
  def change
    change_column :dtls, :session, :integer ,:limit => 8 
    change_column :dtls, :handle, :integer ,:limit => 8 
  end
end
