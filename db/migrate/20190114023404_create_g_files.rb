class CreateGFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :g_files do |t|
      t.string :filename
      t.text :contents
      t.references :gist

      t.timestamps
    end
  end
end
