Dir[File.dirname(__FILE__) + '/../lib/vinyl/migration.rb'].each {|file| require file}

class CreateArtistGroupConnections < Migration
  def self.up
    db.execute("create table if not exists artist_group_connections (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            group_id INTEGER,
            artist_id INTEGER
          )")
  end

  def self.down
    db.execute("drop table artist_group_connections")
  end

end