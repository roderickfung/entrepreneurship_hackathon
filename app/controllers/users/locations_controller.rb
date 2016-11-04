class Users::LocationsController < LoggedinController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new location_params
  end


  private

  def location_params
    params.require(:location).permit(:address, :postal_code)
  end
end
