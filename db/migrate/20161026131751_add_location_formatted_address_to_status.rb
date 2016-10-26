class AddLocationFormattedAddressToStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :location_formatted_address, :string
  end
end
