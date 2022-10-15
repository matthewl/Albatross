# frozen_string_literal: true

require "test_helper"

class Themes::Links::FooterComponentTest < ViewComponent::TestCase
  test "copyright message is rendered" do
    assert_match(
      /© \d{4} Mapleshore Golf Club/,
      render_inline(Themes::Links::FooterComponent.new(website: websites(:mapleshore))).to_html
    )
  end

  test "address is rendered" do
    website = websites(:mapleshore)
    website.create_location(address_line_one: "1 Golf Road", locality: "Mapleshore", region: "Kent")

    assert_match(
      /1 Golf Road, Mapleshore, Kent/,
      render_inline(Themes::Desert::FooterComponent.new(website: website)).to_html
    )
  end
end
