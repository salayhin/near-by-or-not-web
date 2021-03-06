class FranchiseLocation < ApplicationRecord

  self.per_page = 25

  belongs_to :franchise

  scope :within_radius, lambda {|latitude, longitude, metres|
    where('earth_box(ll_to_earth(?, ?), ?) @> ll_to_earth(latitude, longitude)', latitude, longitude, (metres * 0.62)) }

  GOOGLE = {
    :api_key => 'AIzaSyCT_JjIfPDhcfEokwg8QzhCQdgJqBnPCwU'
  }

  STATUS = {
    :OK => 'OK',
    :NOT_FOUND => 'Not Found'
  }

end
