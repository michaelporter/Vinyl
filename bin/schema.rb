require 'lib/populator.rb'

db = SQLite3::Database.open("my_new_records.db")

lambda {


db.execute("create table if not exists albums (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title VARCHAR(100),
            artist VARCHAR(100),
            year  INTEGER(4)
         )")

db.execute("create table if not exists genre_mappings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            album_id INTEGER,
            genre_id INTEGER
          )")

db.execute("create table if not exists artist_groups (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(100),
            description TEXT(1000)
          )")

db.execute("create table if not exists artist_individuals (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(50),
            description TEXT(1000)
          )")

db.execute("create table if not exists artist_group_connections (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            group_id INTEGER,
            artist_id INTEGER
          )")



db.execute("create table if not exists genres (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(100),
            description TEXT(1000)
          )")
populate = Populator.new(db, 'genres')
new_genres = [
      {:name => 'Rock', :description => 'Rock'},
      {:name => "Pop", :description => "Pop"},
      {:name => "Country", :description => "Country"},
      {:name => "Southern", :description => "Southern"},
      {:name => "Jazz", :description => "Jazz"},
      {:name => "Fusion", :description => "Fusion"},
      {:name => "Progressive", :description => "Progressive"},
      {:name => "Indie", :description => "Indie"},
      {:name => "Blues", :description => "Blues"},
      {:name => "Techno", :description => "Techno"},
      {:name => "Disco", :description => "Disco"},
      {:name => "Electronic", :description => "Electronic"},
      {:name => "Metal", :description => "Metal"},
      {:name => "Classical", :description => "Classical music"}
    ]
begin
  new_genres.each { |genre| populate.add(genre) }
  populate.update({:name => 'Rock', :description => 'hey man'})
rescue
  "Something went wronge when populating genre table"
end

}.call