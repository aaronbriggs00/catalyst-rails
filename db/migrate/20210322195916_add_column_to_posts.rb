class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :board_id, :integer
  end
end
