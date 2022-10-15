# frozen_string_literal: true

class Themes::Parkland::FooterComponent < ViewComponent::Base
  def initialize(website:)
    @website = website
  end

  def display_address?
    @website.footer.display_address? && @website.location.present?
  end

  def display_copyright?
    @website.footer.display_copyright?
  end

  def address
    @website.location.formatted_address
  end

  def copyright
    "&copy; #{Time.zone.now.year} #{@website.name}".html_safe
  end
end
