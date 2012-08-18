class Populator

  def initialize(database, table)
    @db = database
    @table = table
  end

  def add(value_pairs)  # these methods will need far better error handling
      result = @db.execute("select * from #{@table} where #{value_pairs.keys.join('= ? and ')} = ?", value_pairs.values)
      if result.length == 0
        @db.execute("insert into #{@table} (#{value_pairs.keys.join(', ')}) VALUES (#{value_pairs.values.map {|x| '\''+x.to_s+'\''  }.join(',')})")
      end
  end

  def update(value_pairs)
    begin
      puts "checking...."
      result = @db.execute("select * from #{@table} where name = ?", value_pairs[:name])
      puts "checked"
    rescue => exception
      puts exception
      puts exception.backtrace
    end

  if result.length > 0
    begin
      puts "trying..."
      stmt = @db.prepare("update #{@table} SET #{value_pairs.keys.join(' = ?, ')} = ? WHERE name = '#{value_pairs[:name]}'")
      stmt.bind_params(value_pairs.values)
      stmt.execute
      puts "updated!"
    rescue => exception
      puts exception
      puts exception.backtrace
    end
  end


  end

  def split_vals(vals)
    ar = []
    until vals.index(', ') == nil do
      place = vals.index(', ')
      ar << vals.slice!(0, place)
      vals.slice!(0,2)
    end  
    ar << vals.slice!(0, vals.length)
    ar.map{|x| '\''+x+'\''}.join(', ')  # returns " 'val', 'val2' "
  end

  def split_vals(val_array)
    i = 0
    val_array.length.times do
      instance_variable_set("@var#{i}", val_array[i])
      i = i+1
    end
    return #what exactly?  To a bind_params argument, likely; can it be an array?
  end



end