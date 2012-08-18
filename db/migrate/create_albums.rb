Dir[File.dirname(__FILE__) + '/../lib/migration.rb'].each {|file| require file}

class CreateAlbums < Migration
  def self.up
    db.execute("create table if not exists albums (
                 id INTEGER PRIMARY KEY AUTOINCREMENT,
                 title VARCHAR(100),
                 artist VARCHAR(100),
                 year  INTEGER(4)
              )")
  end

  def self.down
    db.execute("drop table albums")
  end

end