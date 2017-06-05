class AddDueDateToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :duedate, :datetime
  end
end
