class ChangeColumnOfRequests < ActiveRecord::Migration[5.0]
  def change
    change_column :requests, :status, 'integer USING CAST(status AS integer)'
  end
end
