# frozen_string_literal: true

class Themes::Desert::SubTitleComponent < ViewComponent::Base
  def initialize(sub_title:)
    @sub_title = sub_title
  end

  def render?
    @sub_title.present?
  end
end
