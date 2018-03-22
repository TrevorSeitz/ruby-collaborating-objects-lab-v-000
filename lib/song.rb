require "pry"
class Song

  attr_accessor :artist, :name


  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    @new_song = self.new(filename.split(" - ")[1])
    @new_song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    @new_song
  end

  def self.find_by_artist(artist)
    Song.all.select do |song|
      song.artist == artist
    end
  end

  def artist_name= (name)
    song_artist = Artist.find_or_create_by_name(name)
    @artist = song_artist
    @artist.add_song(self)
    # Artist.add_song(@new_song)
    # self.artist.name
    # if (self.name.nil?)
    #   self.artist = Artist.new(name)
    # else
    #   self.artist.name = name
    # end

  end

  def save
    @@all << self
    self
  end
end
