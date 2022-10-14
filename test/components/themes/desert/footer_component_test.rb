# frozen_string_literal: true

require "test_helper"

class Themes::Desert::FooterComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    assert_match(
      /© \d{4} Mapleshore Golf Club/,
      render_inline(Themes::Desert::FooterComponent.new(website: websites(:mapleshore))).to_html
    )
  end
end
