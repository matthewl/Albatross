# frozen_string_literal: true

class Themes::Desert::HeaderComponent < ViewComponent::Base
  renders_one :banner, Themes::Desert::BannerComponent

  def initialize(header:)
    @header = header
  end
end
