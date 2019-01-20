class CreateShortUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :short_urls do |t|
      t.string :value
      t.references :shortenable, polymorphic: true, index: true
      t.index :value

      t.timestamps
    end
  end
end

