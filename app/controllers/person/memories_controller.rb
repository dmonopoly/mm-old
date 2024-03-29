class Person::MemoriesController < PersonController
  def index
    # Eager loading of time frames & memory time frames
    # http://matthewman.net/2007/01/04/eager-loading-objects-in-a-rails-has_many-through-association/
    # Screencast 22 describes this. 
    # This loads memory_time_frames (a memory has many of these) & the time frame (memory_time_frame has one of these) associations
    # @memories = Memory.find(:all, :include => {:memory_time_frames => :time_frame})
    # Maybe needed later (if memory.time_frames is called...)
    
    @memories = Memory.all
  end
  
  def new
    @memory = Memory.new
    1.times { @memory.time_frames.build }
    1.times { @memory.locations.build }
    # if session[:previous_memory_id]
    #   @previous_memory = session[:previous_memory_id]
    #   @previous_memory.time_frames.count.times { @memory.time_frames.build }
    # else
    #   1.times { @memory.time_frames.build }
    # end
  end
  
  def create
    @memory = Memory.new(params[:memory])
    # params[:time_frames].each do |tf|
    #   if tf.representation.already_exists?
    #     params[:time_frames].delete
    # end
    # no...
    # MemoryTimeFrame.create..?
    
    # session[:previous_memory_id] = @memory.id
    if @memory.save
      flash[:notice] = "New memory saved"
      redirect_to :action => :new # redirect_to [:person, @memory]
    else
      render :action => :new
    end
  end
  
  def show
    @memory = Memory.find(params[:id])
  end
  
  def edit
    @memory = Memory.find(params[:id])
    1.times { @memory.time_frames.build } if @memory.time_frames.empty?
    1.times { @memory.locations.build } if @memory.locations.empty?
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