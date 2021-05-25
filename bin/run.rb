require_relative '../config/environment.rb'
Song.drop_table
Song.create_table
song = Song.new("Here Comes the Sun", "The Beatles", "Classic Rock")
song.save
Song.new("Stairway To Heaven", "Led Zepelin", "Classic Rock").save
song.update(title: "Little Wing", artist: "Jimi Hendrix")
Song.view_table
song.drop
Song.view_table