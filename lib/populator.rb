class Populator

  def initialize(database, table)
    @db = database
    @table = table
  end

  def add(value_pairs)
      result = @db.execute("select * from #{@table} where #{value_pairs.keys.join('= ? and ')} = ?", value_pairs.values)
      if result.length == 0
        @db.execute("insert into #{@table} (#{value_pairs.keys.join(', ')}) VALUES (#{value_pairs.values.map {|x| '\''+x.to_s+'\''  }.join(',')})")
      end
  end

  def update(value_pairs)
      puts "checking...."
      result = @db.execute("select * from #{@table} where name = ?", value_pairs[:name])
      puts "checked"
      if result.length > 0
        puts "trying..."
        @db.execute("update #{@table} SET #{res = [];value_pairs.each_pair {|x,y| res << "#{x} = #{y}"};res.map{|x| '\''+x.to_s+'\'' }.join(', ')}  WHERE name = #{value_pairs[:name]}")
        puts "updated!"
      end

  end
end