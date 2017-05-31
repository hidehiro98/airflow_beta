class AddAuthorRefToComments < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :author
    add_reference :comments, :author, polymorphic: true
  end
end
