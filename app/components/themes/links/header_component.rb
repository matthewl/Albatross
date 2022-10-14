# frozen_string_literal: true

class Themes::Links::HeaderComponent < ViewComponent::Base
  renders_one :banner, Themes::Links::BannerComponent

  def initialize(header:)
    @header = header
  end
end
