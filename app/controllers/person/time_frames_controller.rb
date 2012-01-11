class Person::TimeFramesController < PersonController
  def index
    @time_frames = TimeFrame.all.select { |tf| tf.length != 1 }
    @single_day_tfs = TimeFrame.all.select { |tf| tf.length == 1 }
  end
  
  def new
    @time_frame = TimeFrame.new
  end
  
  def create
  end
  
  def show
    @time_frame = TimeFrame.find(params[:id])
  end
  
  def edit
    @time_frame = TimeFrame.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
end
