class FuelStationSerializer < ActiveModel::Serializer

  attributes :id, :name, :latitude, :longitude,
             :address, :phone_number, :comments, :color_code, :is_active,
             :created_at, :updated_at
end