class Person::MemoriesController < PersonController
  def index
  end
  
  def new
    @memory = Memory.new
  end
end