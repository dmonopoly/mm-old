class Person::MemoriesController < PersonController
  def index
    @memories = Memory.all
  end
  
  def new
    @memory = Memory.new
    1.times { @memory.time_frames.build }
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
  
  def edit
    @memory = Memory.find(params[:id])
    # 1.times { @memory.time_frames.build }
  end
  
  def update
    @memory = Memory.find(params[:id])
    if @memory.update_attributes(params[:memory])
      flash[:notice] = 'Memory updated'
      redirect_to [:person, @memory]
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
    flash[:notice] = 'Memory erased'
    redirect_to :action => :index
  end
end