require 'spec_helper'

describe Person::MemoriesController do
  describe "GET index" do
    it "exists" do
    end
    
    it "succeeds" do
      get :index
    end
  end
  
  describe "GET new" do
    it "exists" do
    end
    
    it "succeeds" do
      get :new
    end
  end
  
  describe "POST create" do
    it "exists" do
    end
    
    it "redirects to the memory" do
      post :create
      response.should redirect_to(:action => :show)
    end
  end
end