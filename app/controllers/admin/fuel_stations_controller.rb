class Admin::FuelStationsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  before_action :set_admin_fuel_station, only: [:show, :edit, :update, :destroy]


  def index
    @fuel_stations = FuelStation.all
  end


  def show
  end

  def new
    @fuel_station = FuelStation.new
  end


  def edit
  end

  def create
    @fuel_station = FuelStation.new(admin_fuel_station_params)

    respond_to do |format|
      if @fuel_station.save
        format.html { redirect_to admin_fuel_stations_path, notice: 'Station was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @fuel_station.update(admin_fuel_station_params)
        format.html { redirect_to admin_fuel_station_path, notice: 'Station was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @fuel_station.destroy
    respond_to do |format|
      format.html { redirect_to admin_fuel_station_path, notice: 'Station was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_fuel_station
    @fuel_station = FuelStation.find(params[:id])
    @colors = [{'color' => 'Blue', 'class' => 'blue'}, {'color' => 'Green', 'class' => 'green'},
               {'color' => 'Yellow', 'class' => 'yellow'}, {'color' => 'Red', 'class' => 'red'},
               {'color' => 'Gray', 'class' => 'gray'}]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_fuel_station_params
    params.require(:fuel_station).permit(:name, :latitude, :longitude, :address,
                                 :phone_number, :comments, :color_code, :is_active)
  end
end

