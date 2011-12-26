class Person::MemoriesController < PersonController
  def index
    @memories = Memory.find(:all, :include => {:memory_time_frames => :time_frame})
    # @memory = Memory.all
    # @productions = Production.find(:all, ... , :include => {:runs => :venue})
  end
  
  def new
    @memory = Memory.new
    1.times { @memory.time_frames.build }
  end
  
  def create
    @memory = Memory.new(params[:memory])
    
    # Save time frame fields for next creation
    # session[:time_frames] = params[:memory][:time_frames_attributes] ?
    # be sure to prevent time frames from being created if they're representations are empty
    
    if @memory.save
      flash[:notice] = "New memory saved"
      # redirect_to [:person, @memory]
      redirect_to :action => :new
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