class RenameQuotesMusicLinkColumn < ActiveRecord::Migration
  def change
    rename_column :quotes, :music_link, :source_link
  end
end
