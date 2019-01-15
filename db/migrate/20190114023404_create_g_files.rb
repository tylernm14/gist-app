class CreateGFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :g_files do |t|
      t.string :name
      t.text :contents
      t.references :gist_id

      t.timestamps
    end
  end
end
