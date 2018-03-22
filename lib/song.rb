require "pry"
class Song

  attr_accessor :artist, :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    new_song = self.new(song_name)
    # binding.pry
    new_song.artist = artist_name
    new_song
  end

  def self.find_by_artist(artist)
    Song.all.select do |song|
      song.artist == artist
    end
  end

  def save
    @@all << self
    self
  end
end
