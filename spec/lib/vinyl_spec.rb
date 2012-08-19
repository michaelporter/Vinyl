require 'bin/vinyl.rb'

describe "Vinyl" do

  it "should give Object a clear_args method" do
    Object.should respond_to(:clear_args)
  end


  
end