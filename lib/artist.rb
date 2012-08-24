class Artist

  def initialize(value_hash)
    me = self
    record = value_hash
    record.each_pair do |key, value|
      me.instance_variable_set("@#{key}", value)
    end
  end

  def db
    @@db
  end

  def save!
    puts "Saved!"
  end

  def self.set_db(db)
    @@db = db
  end

  def self.get_new
    res = {}
    puts "Name:"
    res[:name] = gets.chomp
    puts "Decription:"
    res[:description] = gets.chomp
    res
  end

  def self.find_by_name(name)
    result = ""
  
    # How to keep distinct the band and solo artist names
    
    begin
    stmt = @@db.prepare("select * from 'artist_solos' where first_name=? LIMIT 0,1")
    stmt.bind_params(name)
    result = stmt.execute
    rescue=> e
      puts e
      puts e.backtrace
    end

    if result.length - 1 # does not work
      begin
      stmt = @@db.prepare("select * from 'artist_groups' where name=? LIMIT 0,1")
      stmt.bind_params(name)
      result = stmt.execute
      rescue=> e
        puts e
        puts e.backtrace
      end
    end
    result
  end

end