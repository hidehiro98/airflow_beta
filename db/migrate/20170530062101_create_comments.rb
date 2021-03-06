class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :request, foreign_key: true
      t.references :author, polymophic: true

      t.timestamps
    end
  end
end
