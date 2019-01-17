class AddShortNameToGists < ActiveRecord::Migration[5.2]
  def change
    add_column :gists, :short_url, :string, index: true
    add_index :gists, :short_url
  end
end
