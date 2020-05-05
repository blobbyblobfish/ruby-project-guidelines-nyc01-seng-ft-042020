require_relative '../config/environment'
require "tty-prompt"


def greet_user (name)
    puts "Please enter your name."
    name = gets.strip
    puts "Hello, #{name}"
    User.create(name: name)
end

name = name
greet_user(name)

def create_playlist (playlist_name)
    puts "Name your playlist."
    playlist_name = gets.strip
    playlist = Playlist.create(name: playlist_name)
    puts "Your playlist #{playlist_name} is created."
end

playlist_name = playlist_name
create_playlist(playlist_name)

def add_songs_to_playlist
    prompt = TTY::Prompt.new
    choices = Song.all
    selected_songs = prompt.multi_select("Which songs would you like to add to your playlist?", choices)
    PlaylistSong.create(song: selected_songs.song_id, playlist: playlist.playlist_id)
end

add_songs_to_playlist
