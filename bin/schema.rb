Dir[File.dirname(__FILE__) + '/../db/migrate/*.rb'].each {|file| require file}

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
            description TEXT(1000),
            UNIQUE (name)
          )")

db.execute("create table if not exists artist_individuals (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(50),
            description TEXT(1000),
            UNIQUE (name)
          )")

db.execute("create table if not exists artist_group_connections (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            group_id INTEGER,
            artist_id INTEGER
          )")

genres = CreateGenres.new(db)
genres.down
}.call