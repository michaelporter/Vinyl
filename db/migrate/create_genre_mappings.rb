Dir[File.dirname(__FILE__) + '/../lib/migration.rb'].each {|file| require file}

class CreateGenreMappings < Migration
  def self.up
    db.execute("create table if not exists genre_mappings (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                album_id INTEGER,
                genre_id INTEGER
              )")
  end

  def self.down
    db.execute("drop table genre_mappings")
  end

end