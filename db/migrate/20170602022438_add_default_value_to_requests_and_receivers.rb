class AddDefaultValueToRequestsAndReceivers < ActiveRecord::Migration[5.0]
  def change
    change_column :requests, :status, :integer, default: 0
    change_column :receivers, :status, :integer, default: 0
  end
end
