class Song

  @@all = []
  attr_accessor :name, :artist_name

  def initialize(name = "", artist_name = "")
    @name, @artist_name = name, artist_name
    save
  end

  def self.all() @@all end

  def save() self.class.all << self end

  def self.create() Song.new end

  def self.new_by_name(n) Song.new(n) end

  def self.create_by_name(n) Song.new(n) end

  def self.find_by_name(n) @@all.find { |x| x.name == n } end

  def self.find_or_create_by_name(n)
    @@all.include?(n) ? self.find_by_name(n) : self.create_by_name(n)
  end

  def self.alphabetical() @@all.sort_by { |x| x.name } end

  def self.new_from_filename(n)
    n = n.split(" - ")
    Song.new(n[1].chomp(".mp3"), n[0])
  end

  def self.create_from_filename(n) self.new_from_filename(n) end

  def self.destroy_all() @@all.clear end

end
