require 'pry'
class Song
  attr_accessor :name, :artist
  # attr_reader :artist

  def initialize(name)
    @name = name
    # @artist = artist
  end

  # def artist=(artist_new)
  #   self.artist = artist_new
  # end

  def self.new_by_filename(file_name)
    song_name = file_name.split(" - ")[1]
    artist_name = file_name.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    # artist.save
    # binding.pry
    song = Song.new(song_name)
    song.artist = artist
    #binding.pry
    artist.add_song(song)
    song
  end


end
