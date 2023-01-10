# frozen_string_literal: true

class Themes::Desert::TitleComponent < ViewComponent::Base
  def initialize(title:, sub_title:)
    @title = title
    @sub_title = sub_title
  end

  def render?
    @title.present?
  end
end
