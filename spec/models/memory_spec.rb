require 'spec_helper'

describe Memory do
  before(:each) do
    @memory = Factory(:memory)
  end
  
  it "is valid with necessary attributes" do
    @memory.should be_valid
  end
  
  it "is not valid with no content" do
    @memory.content = nil
    @memory.should_not be_valid
  end
  
  it "is not valid with content > 140 characters" do
    @memory.content = Filler::Memory.too_much_content # 141 characters
    @memory.should_not be_valid
  end
end