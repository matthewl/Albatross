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

  test "does not render when the sub-title is not present" do
    sub_title = ""
    refute_match(
      /mt-4 text-lg tracking-tight text-gray-500 heading/,
      render_inline(Themes::Links::SubTitleComponent.new(sub_title: sub_title)).to_html
    )
  end
end