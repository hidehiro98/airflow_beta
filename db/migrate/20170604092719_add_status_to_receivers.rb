class AddStatusToReceivers < ActiveRecord::Migration[5.0]
  def change
    add_column :receivers, :status, :integer, default: 0
  end
end
