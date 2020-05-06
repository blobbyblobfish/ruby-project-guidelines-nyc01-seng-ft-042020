require 'rspotify'
require 'pry'
require 'json'

RSpotify.authenticate("802526e16b144cd196f882f971617537", "9b191247c7874be1bcfccf254eaa73f7")

Song.delete_all
# Song.create(name: "Break My Heart", artist: "Dua Lipa", genre: "Pop", duration: 4)
# Song.create(name: "Higher Love", artist: "Whitney Houston", genre: "Pop", duration: 4)
# Song.create(name: "Happy Does", artist: "Kenny Chesney", genre: "Country", duration: 4)
# Song.create(name: "Beer Can't Fix", artist: "Thomas Rhett", genre: "Country", duration: 4)
# Song.create(name: "Horizon Variations", artist: "Max Richter", genre: "Classical", duration: 4)
# Song.create(name: "Black Water Pond", artist: "Chad Lawson", genre: "Classical", duration: 4)

# playlist = RSpotify::Playlist.find('osteophyte', '3S6BhDB0xh44FiGzpcaa7n')
# playlist.tracks

# playlist.tracks.each do |track|
#     Song.create(name: track.name, artist: track.artists, duration: track.duration_ms)
# end

artists = RSpotify::Artist.search('Dua Lipa')

tracks = artists.first.albums.first.tracks

tracks.each do |track|
    Song.create(name: track.name, artist: track.artists, duration: track.duration_ms)
end