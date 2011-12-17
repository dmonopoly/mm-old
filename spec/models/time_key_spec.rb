require 'spec_helper'

describe TimeKey do
  before(:each) do
    @time_key = Factory(:time_key)
  end
  
  context "has a category that is only an integer - 1 or 2" do
    it "is invalid if 0" do
      @time_key.category = 0
      @time_key.should_not be_valid
    end

    it "is invalid if 3" do
      @time_key.category = 3
      @time_key.should_not be_valid
    end
        
    it "is valid if 1" do
      @time_key.category = 1
      @time_key.should be_valid
    end
        
    it "is valid if 2" do
      @time_key.category = 2
      @time_key.should be_valid
    end
  end
  
end
