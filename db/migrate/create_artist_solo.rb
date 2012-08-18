Dir[File.dirname(__FILE__) + '/../lib/migration.rb'].each {|file| require file}

class CreateArtistSolos < Migration
  def self.up
    db.execute("create table if not exists artist_solos (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                first_name VARCHAR(50),
                last_name VARCHAR(50),
                description TEXT(1000)
              )")
  end

  def self.down
    db.execute("drop table artist_solos")
  end

end