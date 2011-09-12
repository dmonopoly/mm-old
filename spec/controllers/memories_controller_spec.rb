require 'spec_helper'

describe MemoriesController do
  describe "GET index" do
    it "exists" do
      get :index
    end
  end
  
  describe "GET new" do
    it "exists" do
      get :new
    end
  end
  
end