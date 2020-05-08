require_relative '../config/environment'
require "tty-prompt"
require 'pry'

@prompt = TTY::Prompt.new

def login_or_signup
    choices = ["New user", "Returning user"]
    selection = @prompt.select("Are you a new user or would you like to login?", choices)

    if selection == "New user"
        create_user
    elsif selection == "Returning user"
        login
    end
end

def create_user
    username = @prompt.ask("Please create a username.")
    password = @prompt.mask("Please create a password.")

    if User.all.find {|user| user.username == username}
        puts "This username was already taken"
        create_user
    else
    User.create(username: username, password: password)
    end

    login
end

def login
    puts "Login"
    username = @prompt.ask("Enter your username.")
    password = @prompt.mask("Please enter your password.")

    @user = User.all.find {|user| user.username == username && user.password == password}
    if @user
        actions
    else
        puts "Your login details were incorrect"
        login
    end
end

def actions
    choices = ["View playlists", "Create a playlist", "Edit a playlist", "Delete a playlist", "Exit"]
    selection = @prompt.select("What would you like to do next?", choices)

    if selection == "View playlists"
        view_playlists
    elsif selection == "Create a playlist"
        create_playlist
    elsif selection == "Edit a playlist"
        edit_playlist
    elsif selection == "Delete a playlist"
        delete_playlist
    else
        puts "You're done."
    end
end

def create_playlist 
    playlist_name = @prompt.ask("Name your playlist.")
    puts "Your playlist #{playlist_name} is created."
    new_playlist = Playlist.create(name: playlist_name, user_id: @user.id)

    view_playlist(new_playlist.name)
end

def view_playlists
    user_playlists = Playlist.all.select{|playlist| playlist.user_id == @user.id}

    if user_playlists.count > 0
        playlist = @prompt.select("Which playlist would you like to view?", user_playlists.map{|playlist| playlist.name})
        view_playlist(playlist)
    else
        puts "No playlists"
        actions
    end
end

def view_playlist(playlist)
    if playlist
        puts "Here is your #{playlist} playlist."
        selected_playlist_object = Playlist.all.find {|play_list| play_list.name == playlist}

        if selected_playlist_object.songs.count > 0
            names = selected_playlist_object.songs.map {|song| song.name}
            puts names
        else
            puts "No songs"
        end
    end
    actions
end

def edit_playlist
    user_playlists = Playlist.all.select{|playlist| playlist.user_id == @user.id}

    if user_playlists.count > 0
        selected_playlist = @prompt.select("Choose a playlist", user_playlists.map {|playlist| playlist.name})
        selected_playlist_object = Playlist.all.find {|playlist| playlist.name == selected_playlist}

        choices = ["Add song to playlist", "Delete song from playlist", "Back"]
        selection = @prompt.select("What would you like to do?", choices)

        if selection == "Add song to playlist"
            add_song_to_playlist(selected_playlist_object)
        elsif selection == "Delete song from playlist"
            delete_song_from_playlist(selected_playlist_object)
        else
            actions
        end
    
    else 
        puts "No playlists"
        actions
    end
end

def delete_playlist
    user_playlists = Playlist.all.select{|playlist| playlist.user_id == @user.id}
    if user_playlists.count > 0
        selected_playlist = @prompt.select("Choose a playlist", user_playlists.map {|playlist| playlist.name})
        selected_playlist_object = Playlist.all.find {|playlist| playlist.name == selected_playlist}
        Playlist.destroy(selected_playlist_object.id)
    else 
        puts "No playlists"
    end
    actions
end

def add_song_to_playlist(selected_playlist_object)
    selected_song = @prompt.select("Which song would you like to add to your playlist?", Song.all.map {|song| song.name})
    selected_song_object = Song.all.find {|song| song.name == selected_song}
    new_playlistsong = PlaylistSong.create(song_id: selected_song_object.id, playlist_id: selected_playlist_object.id)

    actions
end

def delete_song_from_playlist(selected_playlist_object)
    if selected_playlist_object.songs.count > 0
        selected_song = @prompt.select("Which song would you like to delete?", selected_playlist_object.songs.map {|song| song.name})
        selected_song_object = Song.all.find {|song| song.name == selected_song}
        selected_playlistsong = selected_playlist_object.playlist_songs.find {|playlistsong| playlistsong.song_id == selected_song_object.id}
        PlaylistSong.destroy(selected_playlistsong.id)

        actions
    else 
        puts "This playlist is empty."
        actions
    end
end

login_or_signup


