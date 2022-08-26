class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  def coordinates_present?
    latitude.present? && longitude.present?
  end

  private

  def address
    [address_line_one, locality, region, country].compact.join(", ")
  end
end
