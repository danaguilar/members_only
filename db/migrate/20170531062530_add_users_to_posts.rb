class AddUsersToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :user_id, :belongs_to
  end
end
