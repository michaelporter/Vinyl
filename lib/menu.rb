
def clear_args(steps=nil)
  ARGV.shift(ARGV.length)
end

def prompt_menu
  clear_args
  puts "What would you like to do?"
    puts %Q{
      1. Add an Album
      2. Add an Artist
      3. Update an Album
      4. Update an Artist
    }
    response = gets.chomp
    action = []
    case response
    when /1/
      action = ["new", "album"]
      new_stuff(action)
    when /2/
      action = ["new", "artist"]
      new_stuff(action)
    when /3/
      action = ["update", "album"]
      update_stuff(action)
    when /4/
      action = ["update", "album"]
      update_stuff(action)
    end
end

def new_stuff(argv)
  argv ||= ARGV
  case argv[1]
  when /album/i, /record/i
    clear_args # allows for gets by clearing the ARGV tray, as it were
    res = Album.get_new
    album = Album.new(res)
    album.save!
  when /artist/i, /band/i, 
    clear_args
    type = ""
    until ["solo", "group"].include? type
      puts "solo or group?"
      type = gets.chomp
    end

    case type
    when /solo/i
      res = ArtistSolo.get_new    # these can be combined, keeping them separate only for now
      artist = ArtistSolo.new(res)
      artist.save!
    when /group/i
      res = ArtistGroup.get_new
      artist = ArtistGroup.new(res)
      artist.save!
    end # solo, group
  end # album, artist, etc
end

def update_stuff(argv)
  argv ||= ARGV
  case argv[1]
  when /artist/i
    clear_args
    puts "Name:"
    artist = gets
    artist = ArtistSolo.find_by_name(artist)
  end

end