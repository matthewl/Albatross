class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.references :locatable, polymorphic: true, null: false
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :address_line_four
      t.string :locality
      t.string :region
      t.string :country
      t.string :post_code
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
