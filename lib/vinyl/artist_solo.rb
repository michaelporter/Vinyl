require 'lib/vinyl/artist.rb'
require 'lib/vinyl/utility.rb'

class ArtistSolo < Artist
  extend Utility::Model

  def initialize(res)
    @vals = res
    super(res) # creates instance vars
  end

  def save!
    stmt = db.prepare("insert into 'artist_solos' (first_name, last_name, description) VALUES (?, ?, ?)")
    stmt.bind_params(@vals[:first_name], @vals[:last_name], @vals[:description])
    super(stmt)
  end

  def update  # needs to set the where
    stmt = db.prepare("update 'artist_solos' SET first_name=?, last_name=?, description=?)")
    stmt.bind_params(self.first_name, self.last_name, self.description)
    super(stmt)
  end

  def self.get_new  # not sure this makes sense anymore
    @vals = {}
    puts "First Name:"
    @vals[:first_name] = gets.chomp
    puts "Last Name:"
    @vals[:last_name] = gets.chomp
    puts "Decription:"
    @vals[:description] = gets.chomp
    @vals
  end

  def self.find_by_name(first_name, last_name) # sanitize input of quotes, etc
    query = @@db.prepare("select * from 'artist_solos' where first_name = '#{first_name}' and last_name = '#{last_name}' LIMIT 0,1")
    result = super(query)
    artist = [:id, :first_name, :last_name, :description]

    artist = ArtistSolo.new(wrap_result(artist, result))
    puts artist.inspect
  end

end