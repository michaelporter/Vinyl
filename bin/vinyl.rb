#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), "/..")

require 'lib/album.rb'
require 'lib/artist_solo.rb'
require 'lib/artist_group.rb'
require 'lib/menu.rb'
require 'lib/migration.rb'
require 'lib/utility.rb'
require 'bin/schema.rb'

include Menu
include Utility

db = SQLite3::Database.open("my_vinyl.db")  # maybe a global here would be worth it
Album.set_db(db)
Artist.set_db(db)

res = {}

case ARGV[0]
when "new", "New", "Add", "add"
  terminator { new_stuff(ARGV) }
when "change", "update"
  terminator { update_stuff(ARGV) }
when "find"
  terminator { find_stuff(ARGV) }
when "migrate"
  terminator { migrate }
else
  terminator { prompt_menu }
end