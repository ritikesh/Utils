require 'open-uri'
require 'fileutils'

# set this variable to set the location where you would like to download the songs to
STRING_PATH = "old-songs"

def raj_kapoor
  download_songs(1..90, "Raj-kapoor")
end

def old_is_gold
  download_songs(91..191, "old-is-gold")
end

def rd_burman
  download_songs(892..935, "rd-burman")
end

def random_movies
  folder = "random-movies"
  download_songs(192..484, folder)
  download_songs(654..891, folder)
  download_songs(936..948, folder)
  download_songs(1063..1083, folder)
end

def directory_check(folder_name)
  path = "#{STRING_PATH}/#{folder_name}"
  FileUtils::mkdir_p(path) unless File.exists?(path)
  path
end

def download_song(id, path)
  IO.copy_stream(open("http://songspk.link/link/revival.php?songid=#{id}"), "#{path}/#{id}.mp3")
end

def download_songs(id_range, folder_name)
  path = directory_check(folder_name)
  id_range.each do |id|
    p "downloading #{folder_name}-#{id}"
    download_song(id, path)
    p "download complete: #{folder_name}-#{id}"
  end
end
