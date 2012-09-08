Dir[File.dirname(__FILE__) + '/../../db/migrate/*.rb'].each {|file| require file}

require 'lib/vinyl/migration.rb'

module DatabaseOperations

  def self.migrate
    db = SQLite3::Database.open("my_vinyl.db")
    Migration.set_db(db)
    lambda {
  
      CreateAlbums.up
  
      CreateGenreMappings.up
  
      CreateArtistGroups.up
    
      CreateArtistSolos.up
  
      CreateGenres.up
  
      PopulateGenres.up
  
    }.call
  end

end