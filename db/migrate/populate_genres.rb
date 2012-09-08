Dir[File.dirname(__FILE__) + '/../../lib/vinyl/migration.rb'].each {|file| require file}

class PopulateGenres < Migration

  class << self
    def new_genres
      [
        {:name => "Rock",        :description => "Rock"},
        {:name => "Pop",         :description => "Pop"},
        {:name => "Country",     :description => "Country"},
        {:name => "Southern",    :description => "Southern"},
        {:name => "Jazz",        :description => "Jazz"},
        {:name => "Fusion",      :description => "Fusion"},
        {:name => "Progressive", :description => "Progressive"},
        {:name => "Indie",       :description => "Indie"},
        {:name => "Blues",       :description => "Blues"},
        {:name => "Techno",      :description => "Techno"},
        {:name => "Disco",       :description => "Disco"},
        {:name => "Electronic",  :description => "Electronic"},
        {:name => "Metal",       :description => "Metal"},
        {:name => "Classical",   :description => "Classical music"}
      ]
    end

    def up
      populate = populator('genres')  # sets table; db is set in Migration

      begin
        new_genres.each { |genre| populate.add(genre) }
      rescue
        "Something went wrong when populating genre table"
      end
    end

    def down
      populate = populator('genres')
      new_genres.each { |genre| populate.delete_these(genre) }
    end
  end

end