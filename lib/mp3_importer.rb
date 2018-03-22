require "pry"
class MP3Importer

  attr_accessor :path

  # @@all = []

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
  end

  def import
    files.each{ |some_filename| Song.new_by_filename(some_filename)}
    

    # binding.pry
  end


end
