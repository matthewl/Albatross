class AddLatitudeAndLongitudeToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :websites, :latitude, :float
    add_column :websites, :longitude, :float
  end
end
