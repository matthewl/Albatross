# frozen_string_literal: true

require "test_helper"

class Themes::Desert::SubTitleComponentTest < ViewComponent::TestCase
  test "renders when sub-title is present" do
    sub_title = "All the recent news from your golf club"
    assert_match(
      /All the recent news from your golf club/,
      render_inline(Themes::Desert::SubTitleComponent.new(sub_title: sub_title)).to_html
    )
  end
end
