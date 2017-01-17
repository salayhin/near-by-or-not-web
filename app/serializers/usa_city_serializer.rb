class UsaCitySerializer < ActiveModel::Serializer

  attributes :name, :state, :zip_code, :latitude, :longitude,
             :created_at, :updated_at
end
