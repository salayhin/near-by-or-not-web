class AddColumnToStationUpdateInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :station_update_infos, :station_id, :integer
  end
end
