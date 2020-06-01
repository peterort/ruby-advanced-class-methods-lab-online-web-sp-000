require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
      song = self.new
      song.save
      song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(search)
    self.all.find {|s| s.name == search}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      return self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    array = filename.split (" - ")
    artist = array[0]
    song_name = array[1].chomp(".mp3")
    song = self.create
    song.artist_name = artist
    song.name = song_name
    song
  end

  def self.create_from_filename(filename)
    array = filename.split (" - ")
    artist = array[0]
    song_name = array[1].chomp(".mp3")
    song = self.create
    song.artist_name = artist
    song.name = song_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
