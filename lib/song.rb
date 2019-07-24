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
      self.all.each do |song|
        if song.name == title
          self.find_by_name(title)
        else 
          self.create_by_name(title)
        end
      end
    end


end
