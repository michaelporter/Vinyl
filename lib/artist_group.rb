class ArtistGroup < Artist

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

end