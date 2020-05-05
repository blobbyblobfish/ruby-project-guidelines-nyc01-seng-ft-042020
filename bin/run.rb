require_relative '../config/environment'
require "tty-prompt"
require 'pry'

$prompt = TTY::Prompt.new


def greet_user (name)
    puts "Please enter your name."
    name = gets.strip
    puts "Hello, #{name}"
    $user = User.create(name: name)
end

def create_playlist (playlist_name)
    puts "Name your playlist."
    playlist_name = gets.strip
    $playlist = Playlist.create(name: playlist_name, user_id: $user.id)
    puts "Your playlist #{playlist_name} is created."
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
    songs = $playlist.songs
    names = $playlist.songs.map {|song| song.name}
    puts names

    actions
end

def add_song_to_playlist
    all_songs = Song.all
    selected_song = $prompt.select("Which song would you like to add to your playlist?", all_songs.map {|song| song.name})
    selected_song_object = all_songs.find {|song| song.name == selected_song}
    new_playlistsong = PlaylistSong.create(song_id: selected_song_object.id, playlist_id: $playlist.id)
    binding.pry

    view_playlist
end

def delete_song
    playlist_songs = $playlist.songs
    selected_song = $prompt.select("Which song would you like to delete?", playlist_songs.map {|song| song.name})
    selected_song_object = Song.all.find {|song| song.name == selected_song}
    selected_playlist_song = PlaylistSong.all.find {|playlistsong| playlistsong.song_id == selected_song_object.id}
    PlaylistSong.destroy(selected_playlist_song.id)

    view_playlist
end

name = name
greet_user(name)

playlist_name = playlist_name
create_playlist(playlist_name)

add_song_to_playlist
actions
actions

