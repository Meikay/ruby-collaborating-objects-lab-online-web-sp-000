class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  # you need to pull an artist name out of the filename first
  # Then you can call artist_name= on the new song


  def self.new_by_filename(file_name)
    song_data = file_name.split(" - ")
    song_name = song_data[1]
    new_song = self.new(song_name)
    artist = new_song.artist #<= you need to pull an artist name out of the filename first
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end



end
