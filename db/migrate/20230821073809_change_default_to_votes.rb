class ChangeDefaultToVotes < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :votes, :integer, default: 0
  end
end
