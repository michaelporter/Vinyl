class Artist

  def initialize(value_hash)
    me = self
    record = value_hash
    record.each_pair do |key, value|              # doesn't make sense to be this flexible 
      me.instance_variable_set("@#{key}", value)  # in the actual models, but this cuts down
      me.class.send("attr_accessor", key)         # on their overhead; value checking falls on them
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

  def self.find_by_name(query)
    result = ""

    stmt = query
    result = stmt.execute rescue e.backtrace

    result
  end

end