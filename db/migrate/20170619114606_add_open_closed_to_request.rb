class AddOpenClosedToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :open_closed, :integer, default: 0
  end
end
