class AddLocationLatitudeToStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :location_latitude, :float
  end
end
