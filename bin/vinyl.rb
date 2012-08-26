#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), "/..")

require 'lib/album.rb'
require 'lib/artist_solo.rb'
require 'lib/artist_group.rb'
require 'lib/menu.rb'
require 'lib/migration.rb'
require 'bin/schema.rb'

db = SQLite3::Database.open("my_new_records.db")  # maybe a global here would be worth it
Album.set_db(db)
Artist.set_db(db)

res = {}

case ARGV[0]
when "new", "New", "Add", "add"
  new_stuff(ARGV)
when "change", "update"
  update_stuff(ARGV)
else
  prompt_menu
  Process.exit
end # new, remove, rm, etc