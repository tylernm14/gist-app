class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.string :short_url, unique: true
      t.string :custom_alias, unique: true
      t.index :short_name
      t.index :custom_alias
      t.timestamps
    end
  end
end
