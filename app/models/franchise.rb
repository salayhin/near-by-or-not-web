class Franchise < ApplicationRecord
  self.per_page = 25

  has_many :franchise_locations

  ALL_FRANCHISE = Franchise.distinct.pluck(:id)

  mount_uploader :logo, FranchiseLogoUploader

  def self.find_franchise(name)
    franchise = Franchise.find_by_name(name)
    if franchise.present?
      franchise.id
    else
      0
    end
  end
end
