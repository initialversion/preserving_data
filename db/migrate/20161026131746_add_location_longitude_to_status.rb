class AddLocationLongitudeToStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :location_longitude, :float
  end
end
