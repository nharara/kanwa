class AddColumnsToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :action, :string
    add_column :entries, :consequence, :string
    add_reference :entries, :user, index: true
  end
end
