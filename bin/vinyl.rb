#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), "/..")

require 'lib/album.rb'
require 'lib/collection.rb'
require 'lib/migration.rb'
require 'bin/schema.rb'


# this file will contain the main program route, and draw from the other files for support


# CLI stuffs

db = SQLite3::Database.new("my_new_records.db")

#db.execute("create table records (
#            title varchar(30),
#            artist varchar(30),
#            year  integer(4),
#            genre varchar2(3)
#         )")

r = Album.new(:title => "Abbey Road", :artist => "The Beatles", :year => 1969, :genre => "Rock/Pop")
q = Album.new(:title => "Electric Ladyland", :artist => "Jimi Hendrix", :year => 1969, :genre => "Rock")

#db.execute("insert into albums (title, artist, year, genre) VALUES ('#{r.title}', '#{r.artist}', '#{r.year}', '#{r.genre}');")
#db.execute("insert into albums (title, artist, year, genre) VALUES ('#{q.title}', '#{q.artist}', '#{q.year}', '#{q.genre}');")
=begin
rows = db.execute2("select * from records");
columns = rows.shift
i=0
hs = []
rows.each do |row|
  col = {}
  row.each do |item|
    col["#{columns[i]}".to_sym] = item
    i = i+1
  end
  hs.push col
  i = 0
end



puts hs
=end

#rows = db.execute("select * from genres")
#rows.each do |row|
#  puts row
#end