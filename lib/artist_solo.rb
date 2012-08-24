require 'lib/artist.rb'

class ArtistSolo < Artist

  def initialize(res)
    @vals = res
    super(res) # creates instance vars
  end

  def save!
    begin
      stmt = db.prepare("insert into 'artist_solos' (first_name, last_name, description) VALUES (?, ?, ?)")
      stmt.bind_params(@vals[:first_name], @vals[:last_name], @vals[:description])
      stmt.execute
    rescue => e
      puts e
      puts e.backtrace
    end
    super
  end

  def update
    begin
      stmt = db.prepare("update 'artist_solos' SET first_name=?, last_name=?, description=?)")
      stmt.bind_params(self.first_name, self.last_name, self.description)
      stmt.execute
    rescue => e
      puts e
      puts e.backtrace
    end
    super

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

  def self.find_by_name(name)
    result = super
    puts result.inspect
  end

end