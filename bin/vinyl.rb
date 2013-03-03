#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), "/..")

require 'lib/vinyl/album.rb'
require 'lib/vinyl/artist_solo.rb'
require 'lib/vinyl/artist_group.rb'
require 'lib/vinyl/menu.rb'
require 'lib/vinyl/migration.rb'
require 'lib/vinyl/utility.rb'
require 'lib/vinyl/database_operations.rb'

include Menu
include Utility::CommandTools

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
  terminator { DatabaseOperations::migrate }
when /\w+/i  # be able to simply type in a name and return search results; if artists are found, returns information about them
  puts ARGV.inspect
  Process.exit
else
  terminator { prompt_menu }
end