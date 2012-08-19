require 'album.rb'

describe "Album" do

  before(:each) do
    @album = Album.new(:title => "Album Title", :artist => "The Rubyists", :year => 2012)
  end

  it "should have a get_new class method" do
    Album.should respond_to(:get_new)
  end

  it "should have a db method" do
    @album.should respond_to(:db)
  end

  it "should have a save! method" do
    @album.should respond_to(:save!)
  end

  it "should have a find_by_title method" do
    @album.should respond_to(:find_by_title)
  end


end