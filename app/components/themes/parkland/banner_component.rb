# frozen_string_literal: true

class Themes::Parkland::BannerComponent < ViewComponent::Base
  def initialize(website:, light: true)
    @website = website
    @light = light
  end
end
