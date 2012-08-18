Dir[File.dirname(__FILE__) + '/../lib/migration.rb'].each {|file| require file}

class CreateGenres < Migration
  def self.up
    db.execute("create table if not exists genres (
                      id INTEGER PRIMARY KEY AUTOINCREMENT,
                      name VARCHAR(100),
                      description TEXT(1000),
                      UNIQUE (name)
              )")
  end

  def self.down
    db.execute("drop table genres")
  end

end