class Artist

  def initialize(value_hash)
    me = self
    record = value_hash
    record.each_pair do |key, value|
      me.instance_variable_set("@#{key}", value)
    end
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

  def db
    @@db
  end



end