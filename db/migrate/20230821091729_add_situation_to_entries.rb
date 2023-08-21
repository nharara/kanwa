class AddSituationToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :situation, :string
  end
end
