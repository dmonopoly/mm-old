class Person::LocationsController < PersonController
  def index
    # Filters for token input (from screencast)
    @locations = Location.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @locations.map(&:attributes) }
    end
  end

end
