Dir[File.dirname(__FILE__) + '/../../lib/migration.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/../../lib/populator.rb'].each {|file| require file}

class CreateGenres < Migration

  def initialize(db=nil)
    @db = db.nil? ? @db : db
    @populate = Populator.new(@db, 'genres')
    @new_genres = [
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
    begin
      @new_genres.each { |genre| @populate.add(genre) }
    rescue
      "Something went wrong when populating genre table"
    end
  end

  def down
    @new_genres.each { |genre| @populate.delete_these(genre) }
  end

end