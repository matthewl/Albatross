# frozen_string_literal: true

class Themes::Parkland::FooterComponent < ViewComponent::Base
  def initialize(website:)
    @website = website
  end

  def message
    "&copy; #{Time.zone.now.year} #{@website.name}".html_safe
  end
end
