class CreateStationUpdateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :station_update_infos do |t|
      t.datetime :update_time

      t.timestamps
    end
  end
end
