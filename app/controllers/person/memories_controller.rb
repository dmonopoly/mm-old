class Person::MemoriesController < PersonController
  def index
  end
  
  def new
    @memory = Memory.new
  end
  
  def create
    @memory = Memory.new(params[:memory])
    
    if @memory.save
      flash[:notice] = "New memory saved"
      redirect_to @memory
    else
      render :action => :new
    end
  end
  
  def show
  end
end