# this file will hold the class that creates a new collection for the user
require 'sqlite3'

class Collection

  attr_reader :current

  def initialize(name)
    # create new database if one does not exist, with the name given as the identifier; may need to set permisssions?
    @current = SQLite3::Database.new("#{name}.db")
  end

  def set_current(database)
    @current = database
  end




end
