
class Migration

  attr_accessor :has_been_run

  class << self
    def up
    end

    def down
    end

    def sideways
      puts "sideways"
    end
  end

  def initialize(db)
    @db = db
  end
end