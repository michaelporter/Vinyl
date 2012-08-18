require 'lib/populator.rb'

class Migration

  class << self

    attr_accessor :db #:has_been_run

    def set_db(db)
      @@db = db
    end

    def populator(table)
      Populator.new(db, table)
    end

    def db # for children to access
      @@db
    end

    def up # for boilerplate handling, if any
    end

    def down
    end
  end
end