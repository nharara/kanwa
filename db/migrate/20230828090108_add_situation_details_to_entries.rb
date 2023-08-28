class AddSituationDetailsToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :situation_details, :string
  end
end
