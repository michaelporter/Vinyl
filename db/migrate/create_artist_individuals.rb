Dir[File.dirname(__FILE__) + '/../lib/migration.rb'].each {|file| require file}

class CreateArtistIndividuals < Migration
  def self.up
    db.execute("create table if not exists artist_individuals (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name VARCHAR(50),
                description TEXT(1000),
                UNIQUE (name)
              )")
  end

  def self.down
    db.execute("drop table artist_individuals")
  end

end