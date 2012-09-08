require 'lib/vinyl/artist.rb'
require 'lib/vinyl/utility.rb'

class ArtistGroup < Artist
  extend Utility::Model

  def initialize(res)
    @vals = res
    super(res) # creates instance vars
  end

  def save!
    stmt = db.prepare("insert into 'artist_groups' (name, description) VALUES (?, ?)")
    stmt.bind_params(@vals[:name], @vals[:description])
    super(stmt)
  end

  def update # needs to find the where
    stmt = db.prepare("update 'artist_groups' SET name=?, description=?)")
    stmt.bind_params(self.first_name, self.last_name, self.description)
    super(stmt)
  end

  def self.get_new  # not sure this makes sense anymore
    @vals = {}
    puts "Band Name:"
    @vals[:name] = gets.chomp
    puts "Decription:"
    @vals[:description] = gets.chomp
    @vals
  end

  def self.find_by_name(name) # sanitize input of quotes, etc
    query = @@db.prepare("select * from 'artist_groups' where name = '#{name}' LIMIT 0,1")
    result = super(query)
    artist = [:id, :name, :description]

    artist = ArtistGroup.new(wrap_result(artist, result))
    puts artist.inspect
  end
end