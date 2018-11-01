class CreateArtistGenre < ActiveRecord::Migration
  def change
    create_table :artist_genres do |t|
      t.belongs_to :artist
      t.belongs_to :genre
    end
  end
end
