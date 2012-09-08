Dir[File.dirname(__FILE__) + '/../db/migrate/*.rb'].each {|file| require file}

require 'bin/vinyl.rb'
require 'lib/populator.rb'
require 'lib/migration.rb'

module Migrations # not being included properly; might want to just go for a rake task
                  # to speed through the files; would require a timestamp-like thing, though
  def migrate
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