# frozen_string_literal: true

class Themes::Links::FooterComponent < ViewComponent::Base
  def initialize(website:)
    @website = website
  end

  def address
    @website.location.formatted_address if @website.location.present?
  end

  def copyright
    "&copy; #{Time.zone.now.year} #{@website.name}".html_safe
  end
end
