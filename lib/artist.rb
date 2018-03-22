
require "pry"
class Artist

  attr_accessor :name, :song, :genre
  @@all = []

  def initialize(name)
    @name = name
    @genre = genre
    @songs = []
    save
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    unless @@all.include?(self.name)
      @@all << self
    end
    # binding.pry
    @@all
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    @@all.each do |artist|
      # binding.pry
      if artist.name. == name
        return artist
      else
        return self.new(name)
      end
    end
  end

  def songs
    @songs
  end

  def print_songs
    @songs.each do |song|
      puts song.name + "\n"
    end
  end
end
