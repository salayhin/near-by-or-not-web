class Franchise < ApplicationRecord
  scope :within_radius, lambda {|latitude, longitude, metres|
    where("earth_box(ll_to_earth(?, ?), ?) @> ll_to_earth(latitude, longitude)", latitude, longitude, metres) }

end
