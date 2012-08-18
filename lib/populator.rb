class Populator

  def initialize(database, table)
    @db = database
    @table = table
  end

  def add(value_pairs)  # these methods will need far better error handling
      result = ""
      rescue_me do
        result = @db.execute("select * from #{@table} where #{value_pairs.keys.join('= ? and ')} = ?", value_pairs.values)
        if result.length < 1
          puts "Added! " + value_pairs.inspect
          @db.execute("insert into #{@table} (#{value_pairs.keys.join(', ')}) VALUES (#{value_pairs.values.map {|x| '\''+x.to_s+'\''  }.join(',')})")
        end
        value_pairs
      end
  end

  def update(value_pairs)
    result = ""
    rescue_me do
      puts "checking...."
      result = @db.execute("select * from #{@table} where name = ?", value_pairs[:name])
      puts "checked"
    end


    if result.length > 0
      rescue_me do
        puts "trying..."
        stmt = @db.prepare("update #{@table} SET #{value_pairs.keys.join(' = ?, ')} = ? WHERE name = '#{value_pairs[:name]}'")
        stmt.bind_params(value_pairs.values)
        stmt.execute
        puts "Updated! " + value_pairs.inspect
        puts "updated!"
      end
    end
  end

  def delete_these(value_pairs)
    result = ""
    rescue_me do
      puts "checking...."
      result = @db.execute("select * from #{@table} where name = ?", value_pairs[:name])
      puts "checked"
    end

    if result.length > 0
      rescue_me do
        puts "deleting..."
        stmt = @db.prepare("delete from #{@table} WHERE #{value_pairs.keys.join(' = ? and ')} = ?")
        stmt.bind_params(value_pairs.values)
        stmt.execute
        puts "Deleted! " + value_pairs.inspect
        puts "deleted!"
      end
    end
  end

  def rescue_me(&block)
    begin
      vals = yield if block_given?
    rescue => e
      puts "Error! #{e} : #{vals.inspect}"
      puts e.backtrace
    end
  end
end