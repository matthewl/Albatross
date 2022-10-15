# frozen_string_literal: true

class Themes::Links::FooterComponent < ViewComponent::Base
  def initialize(website:)
    @website = website
  end

  def copyright
    "&copy; #{Time.zone.now.year} #{@website.name}".html_safe
  end
end
