Dir[File.dirname(__FILE__) + '/../db/migrate/*.rb'].each {|file| require file}

require 'lib/populator.rb'
require 'lib/migration.rb'

db = SQLite3::Database.open("my_new_records.db")
Migration.set_db(db)


def migrate
  lambda {
  
    CreateAlbums.up
  
    CreateGenreMappings.up
  
    CreateArtistGroups.up
    
    CreateArtistSolos.up
  
    CreateGenres.up
  
    PopulateGenres.up
  
  }.call
end