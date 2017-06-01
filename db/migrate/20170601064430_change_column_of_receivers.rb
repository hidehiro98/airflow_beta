class ChangeColumnOfReceivers < ActiveRecord::Migration[5.0]
  def change
    change_column :receivers, :status, 'integer USING CAST(status AS integer)'
  end
end
