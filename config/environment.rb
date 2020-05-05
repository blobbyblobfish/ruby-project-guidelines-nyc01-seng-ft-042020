require 'bundler'
Bundler.require

require_relative "../app/models/song.rb"
require_relative "../app/models/playlist.rb"
require_relative "../app/models/playlist_song.rb"
require_relative "../app/models/user.rb"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
