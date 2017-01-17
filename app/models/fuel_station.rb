class FuelStation < ApplicationRecord
  #after_save :update_station_info_save, on: [:create, :update]
  after_commit :update_station_info


  private

  def update_station_info
    station = FuelStation.find(self.id)
    if station.present?
      StationUpdateInfo.create(:update_time => Time.now, :station_id => station.id)
    end
  end

end
