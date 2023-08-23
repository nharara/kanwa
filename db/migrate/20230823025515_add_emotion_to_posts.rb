class AddEmotionToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :emotion, foreign_key: true
  end
end
