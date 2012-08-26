require 'rubygems'
require 'sqlite3'
require 'lib/utility.rb'

class Album
  extend Utility::Model

  attr_accessor :title, :artist, :year, :genre  # this will need to map to the correct values;
                                                # depends on how the object will be mapped from the database

  def initialize(value_hash) # :title, :artist, :year, :genre
    me = self
    record = value_hash
    record.each_pair do |key, value|
      me.instance_variable_set("@#{key}", value)
      me.class.send("attr_accessor", key) 
    end
  end

  def self.get_new
    res = {}
    puts "Title:"
      res[:title] = gets.chomp
    puts "Arist:"
      res[:artist] = gets.chomp
    puts "Year: "
      res[:year] = gets.chomp

    res
  end

  def self.set_db(db)
    @@db = db
  end

  def db
    @@db
  end

  def save!
    db.execute("insert into albums (title, artist, year) VALUES (?,?,?)", title, artist, year)
  end
 
  def update!
    # stores the current state of the object into the same row
  end

  def update_attribute(attribute, value)
  end

  def update_attributes(a_hash)
  end

  def show
    # shows the record's information in a an attractive way
  end

  def self.find_by_title(title)
    stmt = @@db.prepare("select * from 'albums' WHERE title='#{title}' LIMIT 0,1")
    result = stmt.execute rescue e.backtrace

    album = [:id, :title, :artist, :year]

    album = Album.new(wrap_result(album, result))
    puts album.inspect
  end

  def find_by_artist(artist)
  end

  def find_by_year(year)
  end

  def find_within_range(year1, year2)
  end

  def find_within_decade(decade)
  end

  def find_by_genre(genre)
  end
end
