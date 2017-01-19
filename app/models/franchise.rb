class Franchise < ApplicationRecord

  self.per_page = 25

  scope :within_radius, lambda {|latitude, longitude, metres|
    where('earth_box(ll_to_earth(?, ?), ?) @> ll_to_earth(latitude, longitude)', latitude, longitude, metres) }

end
