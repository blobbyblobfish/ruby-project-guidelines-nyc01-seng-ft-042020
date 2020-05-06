require_relative '../config/environment'
require "tty-prompt"
require 'pry'

$prompt = TTY::Prompt.new


def greet_user
    puts "Please enter your name."
    name = gets.strip
    puts "Hello, #{name}"
    $user = User.create(name: name)
end

def create_playlist 
    puts "Name your playlist."
    playlist_name = gets.strip
    puts "Your playlist #{playlist_name} is created."
    $playlist = Playlist.create(name: playlist_name, user_id: $user.id)
end

def actions
    choices = ["Add another song", "View playlist", "Delete a song", "Exit"]
    selection = $prompt.select("What would you like to do next?", choices)

    if selection == "Add another song"
        add_song_to_playlist
    elsif selection == "View playlist"
        view_playlist
    elsif selection == "Delete a song"
        delete_song
    elsif selection == "Exit"
        puts "You're done."
    end
end

def view_playlist
    puts "Here is your #{$playlist.name} playlist."
    names = $playlist.songs.map {|song| song.name}
    puts names

    actions
end

def add_song_to_playlist
    selected_song = $prompt.select("Which song would you like to add to your playlist?", Song.all.map {|song| song.name})
    selected_song_object = Song.all.find {|song| song.name == selected_song}
    new_playlistsong = PlaylistSong.create(song_id: selected_song_object.id, playlist_id: $playlist.id)
    
    view_playlist
end

def delete_song
    selected_song = $prompt.select("Which song would you like to delete?", $playlist.songs.map {|song| song.name})
    selected_song_object = Song.all.find {|song| song.name == selected_song}
    selected_playlistsong = $playlist.playlist_songs.find {|playlistsong| playlistsong.song_id == selected_song_object.id}
    PlaylistSong.destroy(selected_playlistsong.id)

    view_playlist
end

greet_user
create_playlist
add_song_to_playlist


