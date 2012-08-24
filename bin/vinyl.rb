#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), "/..")

require 'lib/album.rb'
require 'lib/artist_solo.rb'
require 'lib/artist_group.rb'
require 'lib/migration.rb'
require 'bin/schema.rb'

db = SQLite3::Database.open("my_new_records.db")  # maybe a global here would be worth it
Album.set_db(db)
Artist.set_db(db)

def clear_args(steps)
  ARGV.shift(steps)
end

res = {}

case ARGV[0]
when "new", "New", "Add", "add"

  case ARGV[1]
  when /album/i, /record/i
    clear_args(2) # allows for gets by clearing the ARGV tray, as it were
    res = Album.get_new
    album = Album.new(res)
    album.save!
  when /artist/i, /band/i, 
    clear_args(2)
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
when "change", "update"
  case ARGV[1]
  when /artist/i
    clear_args(2)
    puts "Name:"
    artist = gets
    artist = ArtistSolo.find_by_name(artist)
  end
end # new, remove, rm, etc