class AddColumnToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :title, :text
  end
end
