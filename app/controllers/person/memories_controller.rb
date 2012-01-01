class Person::MemoriesController < PersonController
  def index
    # Eager loading of time frames & memory time frames
    # http://matthewman.net/2007/01/04/eager-loading-objects-in-a-rails-has_many-through-association/
    @memories = Memory.find(:all, :include => {:memory_time_frames => :time_frame})
    # @memories = Memory.all
    # @productions = Production.find(:all, ... , :include => {:runs => :venue})
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
    # session[:previous_memory_id] = @memory.id
    if @memory.save
      flash[:notice] = "New memory saved"
      # Remove time frames that are ""
      @memory.time_frames.each do |tf|
        tf.destroy if tf.representation.strip == ""
      end
      # Remove locations that are ""
      @memory.locations.each do |loc|
        loc.destroy if loc.name.strip == ""
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
    1.times { @memory.time_frames.build } if @memory.time_frames.empty?
    1.times { @memory.locations.build } if @memory.locations.empty?
  end
  
  def update
    @memory = Memory.find(params[:id])
    if @memory.update_attributes(params[:memory])
      flash[:notice] = 'Memory updated'
      # Remove time frames that are ""
      @memory.time_frames.each do |tf|
        tf.destroy if tf.representation.strip == ""
      end
      # Remove locations that are ""
      @memory.locations.each do |loc|
        loc.destroy if loc.name.strip == ""
      end
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