class AddShortNameToGists < ActiveRecord::Migration[5.2]
  def change
    add_column :gists, :short_name, :string, index: true
    add_index :gists, :short_name
  end
end
