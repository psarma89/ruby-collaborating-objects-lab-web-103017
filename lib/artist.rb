require 'pry'
class Artist

  @@all = []
  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self
    self.songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist_exist =  self.all.find{|artist| artist.name == name}
    if artist_exist
      artist_exist
    else
      artist= Artist.new(name)
      artist.save
      artist
    end

  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def print_songs
    self.songs.each{|song| puts "#{song.name}"}
  end

end
