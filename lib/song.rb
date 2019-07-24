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
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title

    return song
  end

    def Song.create_by_name(title)
      song = self.new
      @@all << song
      song.name = title
      song
    end

    def Song.find_by_name(title)
      self.all.find {|song| song.name == title}
    end

    def self.find_or_create_by_name(title)
      self.find_by_name(title) || self.create_by_name(title)
    end

    def self.alphabetical
      self.all.sort_by {|song| song.name}
    end

    def Song.new_from_filename(info)

      separated = info.split(" - ")
      artist = separated[0]
      title = separated[1].gsub(".mp3","")

      song = self.new
      song.name = title
      song.artist_name = artist

      song
    end

    def self.create_from_filename(info)
      separated = info.split(" - ")
      artist = separated[0]
      title = separated[1].gsub(".mp3","")

      song = self.create
      song.name = title
      song.artist_name = artist
      song
    end

    def self.destroy_all
      self.all.clear
end

end
