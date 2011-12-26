class Person::MemoriesController < PersonController
  def index
    @memories = Memory.find(:all, :include => {:memory_time_frames => :time_frame})
    # @memory = Memory.all
    # @productions = Production.find(:all, ... , :include => {:runs => :venue})
  end
  
  def new
    @memory = Memory.new
    1.times { @memory.time_frames.build }
    # if session[:previous_memory_id]
    #   @previous_memory = session[:previous_memory_id]
    #   @previous_memory.time_frames.count.times { @memory.time_frames.build }
    # else
    #   1.times { @memory.time_frames.build }
    # end
  end
  
  def create
    @memory = Memory.new(params[:memory])
    # session[:previous_memory_id] = @memory.id
    if @memory.save
      flash[:notice] = "New memory saved"
      # Remove time frames that are ""
      @memory.time_frames.each do |tf|
        tf.destroy if tf.representation.strip == ""
      end
      
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