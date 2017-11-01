class AddAuthorIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :author_id, :interger
    add_index :posts, :author_id
  end
end
