
require "pry"
class Artist

  attr_accessor :name, :song, :genre
  @@all = []

  def initialize(name)
    @name = name
    @genre = genre
    @songs = []
    # save
    @@all.each do |artist|
      # binding.pry
      if artist.name == name
        return artist
      else
        # binding.pry
        save
      end
      # binding.pry
    end
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_song_by_name(name, genre)
    song = Song.new(name, genre)
    @song << song
    @song.artist = self
    @song
  end

  def songs
    @songs
  end

  def save
    @@all << self
    @@all
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    @@all.each do |artist|
      if artist.name == name
        return artist
      else
        return self.new(name)
      end
    end
    artist
  end

  def print_songs
    @songs.each do |song|
      puts song.name + "\n"
    end
  end
end
