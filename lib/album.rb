#!/usr/bin/ruby

require 'rubygems'
require 'sqlite3'

# This file will store the Record class, which will create new records
# How will I know which database to use?
#   would a class method for Record do the job?  It could be changed from outside record, correct?  
#        if not, there could be a class method for that 


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

  def save!
    # code to store the instance variables in the database;
    # should check if there is a column for the variable, and if there is, store the value there;
    # consider creating new columns, but probably decide against it;
    # return false if fails
    
    # also, print out the saved record?
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
