require 'rubygems'
require 'sqlite3'

class Album

  attr_accessor :title, :artist, :year, :genre  # this will need to map to the correct values;
                                                # depends on how the object will be mapped from the database

  def initialize(value_hash) # :title, :artist, :year, :genre
    me = self
    record = value_hash
    record.each_pair do |key, value|
      me.instance_variable_set("@#{key}", value)
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

  def find_by_title(title)
    # searches db for record, returns record or false
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
