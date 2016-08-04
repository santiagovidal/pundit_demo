class AddColumnsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :description, :string
    add_column :posts, :user_id, :integer
  end
end
