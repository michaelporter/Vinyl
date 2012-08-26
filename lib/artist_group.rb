require 'lib/artist.rb'
require 'lib/utility.rb'

class ArtistGroup < Artist
  extend Utility::Model

  def initialize(res)
    @vals = res
    super(res) # creates instance vars
  end

  def save!
    begin
      stmt = db.prepare("insert into 'artist_groups' (name, description) VALUES (?, ?)")
      stmt.bind_params(@vals[:name], @vals[:description])
      stmt.execute
    rescue => e
      puts e
      puts e.backtrace
    end
    super
  end

  def self.get_new  # not sure this makes sense anymore
    @vals = {}
    puts "Band Name:"
    @vals[:name] = gets.chomp
    puts "Decription:"
    @vals[:description] = gets.chomp
    @vals
  end

  def self.find_by_name(name)
    # sanitize input of quotes, etc
    query = @@db.prepare("select * from 'artist_groups' where name = '#{name}' LIMIT 0,1")
    result = super(query)
    artist = [:id, :name, :description]

    artist = ArtistGroup.new(wrap_result(artist, result))
    puts artist.inspect
  end

end