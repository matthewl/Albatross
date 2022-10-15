class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  after_validation :geocode

  geocoded_by :address

  def coordinates_present?
    latitude.present? && longitude.present?
  end

  def formatted_address
    full_address = ""
    full_address << address_line_one if address_line_one.present?
    full_address << ", #{address_line_two}" if address_line_two.present?
    full_address << ", #{locality}" if locality.present?
    full_address << ", #{region}" if region.present?
    full_address << ", #{post_code}" if post_code.present?

    full_address
  end

  private

  def address
    [address_line_one, locality, region, country].compact.join(", ")
  end
end
