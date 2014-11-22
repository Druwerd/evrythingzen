class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :text
      t.string :source
      t.string :music_link
      t.string :zen_link

      t.timestamps
    end
  end
end
