class Playlist < ActiveRecord::Base
    has_many :playlist_songs
    has_many :songs, through: :playlist_songs
    belongs_to :user

    def playlist_songs
        PlaylistSong.all.select {|playlistsong| playlistsong.playlist_id == self.id}
    end

    def songs
        song_ids = playlist_songs.map {|playlistsong| playlistsong.song_id}
        
        index = 0
        songs = []

        song_ids.count.times do     
            songs << Song.all.find {|song| song.id == song_ids[index]}
            index +=1 
        end

        songs
    end
end