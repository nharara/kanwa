class AddEmotionReferenceToEntries < ActiveRecord::Migration[7.0]
  def change
    remove_reference :entries, :user, index: true
    add_reference :entries, :user, foreign_key: true
    add_reference :entries, :emotion, foreign_key: true
  end
end
