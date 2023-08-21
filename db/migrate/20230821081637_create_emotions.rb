class CreateEmotions < ActiveRecord::Migration[7.0]
  def change
    create_table :emotions do |t|
      t.string :name
      t.references :emotion, foreign_key: true

      t.timestamps
    end
  end
end
