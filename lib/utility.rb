
module Utility
  def clear_args(steps=nil)
    ARGV.shift(ARGV.length)
  end

  def terminator(&block)
    yield if block_given?
    Process.exit
  end

  module Model

    def wrap_result(keys, result)
      hs = {}
      i=0
      result.each do |row|  
        row.each do |item|
          hs[keys[i]] = item
          i = i+1
        end
      end
      hs
    end
  end

end
