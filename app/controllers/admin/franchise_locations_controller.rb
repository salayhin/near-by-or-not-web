class Admin::FranchiseLocationsController < ApplicationController
  require 'net/http'
  require 'json'

  before_filter :authenticate_user!
  layout 'admin'
  before_action :set_admin_franchise, only: [:show, :edit, :update, :destroy]


  def index
    @franchises = FranchiseLocation.paginate(:page => params[:page])
  end


  def show
  end

  def new
    @franchises = FranchiseLocation.new
  end


  def edit
  end

  def all_location_by_franchise_id
    @franchises = FranchiseLocation.where(:franchise_id => params[:franchise_id]).paginate(:page => params[:page]) if params[:franchise_id].present?
  end

  def search
    if request.post?
      search_address
    end
  end

  def search_submit
  end

  def search_address
    data = self.get_latitude_and_longitude(params['search'])

    if data['status'] == FranchiseLocation::STATUS[:OK]
      @results = FranchiseLocation.within_radius(data['lat'], data['lng'], 10000)
      @nearby_franchises = FranchiseLocation.within_radius(data['lat'], data['lng'], 10000).distinct.pluck(:franchise_id)

      #not_near_by_franchises = Franchise::ALL_FRANCHISE - @nearby_franchises
      @not_near_by_franchises = Franchise.where(:id => Franchise::ALL_FRANCHISE - @nearby_franchises).order('rank DESC') if @nearby_franchises.present?
      @search_param = data['search_param']
    end

    if data['status'] == FranchiseLocation::STATUS[:NOT_FOUND]
      @results = []
      @search_param = data['search_param']
      @not_near_by_franchises = FranchiseLocation::ALL_FRANCHISE
    end
  end

  def get_latitude_and_longitude(address)
    url = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + address + '&key=' + FranchiseLocation::GOOGLE[:api_key]

    escaped_address = URI.escape(url)
    uri = URI.parse(escaped_address)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    if data['results'].size > 0 && data['status'] == 'OK'
      lat = data['results'][0]['geometry']['location']['lat']
      lng = data['results'][0]['geometry']['location']['lng']

      {'status' => FranchiseLocation::STATUS[:OK], 'lat' => lat, 'lng' => lng, 'search_param' => address}

    else
      {'status' => FranchiseLocation::STATUS[:NOT_FOUND], 'search_param' => address}
    end

  end


  def create
    @franchise = FranchiseLocation.new(admin_franchise_params)

    respond_to do |format|
      if @franchise.save
        format.html { redirect_to admin_franchise_locations_path, notice: 'Franchise Location was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @franchise.update(admin_franchise_params)
        format.html { redirect_to admin_franchise_locations_path, notice: 'Franchise Location was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @franchise.destroy
    respond_to do |format|
      format.html { redirect_to admin_franchise_locations_path, notice: 'Franchise Location was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_franchise
    @franchise = FranchiseLocation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_franchise_params
    params.require(:franchise).permit(:factual_id, :name, :address, :locality, :region, :post_code, :country,
                                      :telephone, :website, :latitude, :longitude, :hours_of_operations,
                                      :category_labels, :chain_name)
  end
end

