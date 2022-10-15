# frozen_string_literal: true

require "test_helper"

class Themes::Parkland::FooterComponentTest < ViewComponent::TestCase
  test "copyright message is rendered" do
    assert_match(
      /© \d{4} Mapleshore Golf Club/,
      render_inline(Themes::Parkland::FooterComponent.new(website: websites(:mapleshore))).to_html
    )
  end
end
