# frozen_string_literal: true

class Themes::Desert::BannerComponent < ViewComponent::Base
  def initialize(website:, light: true)
    @website = website
    @light = light
  end
end
