class AddCommentIdToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :comment_id, :integer
  end
end
