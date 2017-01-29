class HomeController < ApplicationController
  before_action :authenticate_user!
  layout 'application'

  def index
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
      @not_near_by_franchises = Franchise.where(:id => Franchise::ALL_FRANCHISE - @nearby_franchises).order('is_client DESC, rank DESC') if @nearby_franchises.present?
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

end
