require "pry"
class Song

  attr_accessor :artist, :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(filename)
    new_song = self.new(filename.split(" - ")[1])
    new_song.artist = Artist.new(filename.split(" - ")[0])
    new_song
  end

  def self.find_by_artist(artist)
    Song.all.select do |song|
      song.artist == artist
    end
  end

  def artist_name
    # self.artist.name
    if (self.name.nil?)
      self.artist = Artist.new(name)
    else
      self.artist.name = name
    end
  end

  def save
    @@all << self
    self
  end
end
