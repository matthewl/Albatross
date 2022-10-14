# frozen_string_literal: true

class Themes::Parkland::HeaderComponent < ViewComponent::Base
  renders_one :banner, Themes::Parkland::BannerComponent

  def initialize(header:)
    @header = header
  end
end
