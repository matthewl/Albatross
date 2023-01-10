# frozen_string_literal: true

require "test_helper"

class Themes::Links::TitleComponentTest < ViewComponent::TestCase
  test "renders when title is present" do
    title = "Recent News"
    sub_title = "All the recent news from your golf club"

    assert_match(
      /Recent News/,
      render_inline(Themes::Links::TitleComponent.new(title: title, sub_title: sub_title)).to_html
    )

    assert_match(
      /All the recent news from your golf club/,
      render_inline(Themes::Links::TitleComponent.new(title: title, sub_title: sub_title)).to_html
    )
  end

  test "does not render when title is not present" do
    title = ""
    sub_title = "All the recent news from your golf club"

    refute_match(
      /All the recent news from your golf club/,
      render_inline(Themes::Desert::TitleComponent.new(title: title, sub_title: sub_title)).to_html
    )
  end
end
