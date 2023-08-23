class AddPostToEmotions < ActiveRecord::Migration[7.0]
  def change
    add_reference :emotions, :post, foreign_key: true
  end
end
