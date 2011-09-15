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
      redirect_to [:person, @memory]
    else
      render :action => :new
    end
  end
  
  def show
    @memory = Memory.find(params[:id])
  end
end