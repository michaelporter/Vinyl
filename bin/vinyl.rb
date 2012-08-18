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

#puts ARGV.inspect
res = {}

case ARGV[0]
when "new"

  case ARGV[1]
  when "album"
    clear_args(2) # allows for gets by clearing the ARGV tray, as it were
    res = Album.get_new
    album = Album.new(res)
    album.save!
  when "artist"
    clear_args(2)
    type = ""
    until ["solo", "group"].include? type
      puts "solo or group?"
      type = gets.chomp
    end

    case type
    when "solo"
      res = ArtistSolo.get_new
      artist = ArtistSolo.new(res)
      artist.save!
    when "group"
      res = ArtistGroup.get_new
      artist = ArtistGroup.new(res)
      artist.save!
    end # internal ARGV for solo vs group artist
  end # second ARGV ("album", "artist", etc)
end # first ARGV ("new", "remove", "rm", etc)