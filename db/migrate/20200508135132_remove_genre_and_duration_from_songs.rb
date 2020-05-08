class RemoveGenreAndDurationFromSongs < ActiveRecord::Migration[6.0]
  def change
    remove_column :songs, :genre, :string
    remove_column :songs, :duration, :integer
  end
end
