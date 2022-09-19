class Admin::BackgroundImageComponent < ViewComponent::Base
  DEFAULT_COVER = "default_splash.jpg"

  attr_reader :image, :data, :classes

  def initialize(header:, data: {}, classes: "")
    @image = header.background_image.attached? ? header.background_image : DEFAULT_COVER
    @data = data
    @classes = classes
  end
end
