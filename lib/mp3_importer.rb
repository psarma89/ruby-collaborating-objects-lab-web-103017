require 'pry'
class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir[self.path+"/*.mp3"]
    mp3s = files.collect{|file| file.split(/[\/]/)[-1]}
    # binding.pry
  end

  def import
    mp3s = self.files
    mp3s.each do |mp3|
      Song.new_by_filename(mp3)
    end

  end
end
