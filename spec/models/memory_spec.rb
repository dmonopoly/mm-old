require 'spec_helper'

describe Memory do
  before(:each) do
    @memory = Factory(:memory)
  end
  
  it "is valid with necessary attributes" do
    @memory.should be_valid
  end
end