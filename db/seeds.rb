require 'rspotify'
require 'pry'

RSpotify.authenticate("802526e16b144cd196f882f971617537", "9b191247c7874be1bcfccf254eaa73f7")

Song.delete_all
Song.create(name: "Break My Heart", artist: "Dua Lipa", genre: "Pop", duration: 4)
Song.create(name: "Higher Love", artist: "Whitney Houston", genre: "Pop", duration: 4)
Song.create(name: "Happy Does", artist: "Kenny Chesney", genre: "Country", duration: 4)
Song.create(name: "Beer Can't Fix", artist: "Thomas Rhett", genre: "Country", duration: 4)
Song.create(name: "Horizon Variations", artist: "Max Richter", genre: "Classical", duration: 4)
Song.create(name: "Black Water Pond", artist: "Chad Lawson", genre: "Classical", duration: 4)

# artists = RSpotify::Artist.search('Dua Lipa')

# dua_lipa = artists.first

# albums = dua_lipa.albums

# am = albums.first

# tracks = am.tracks

# tracks.each do |track|
#     hash = {}
#     binding.pry
#     Song.create(track.instance_variables.each{|var|hash[var.to_s.delete("@")] = track.instance_variable_get(var) })
# end
