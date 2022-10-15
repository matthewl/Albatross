# frozen_string_literal: true

require "test_helper"

class Themes::Parkland::FooterComponentTest < ViewComponent::TestCase
  test "copyright message is rendered when toggled on" do
    assert_match(
      /© \d{4} Mapleshore Golf Club/,
      render_inline(Themes::Parkland::FooterComponent.new(website: websites(:mapleshore))).to_html
    )
  end

  test "copyright message is not rendered when toggled on" do
    websites(:mapleshore).footer.update(display_copyright: false)

    refute_match(
      /© \d{4} Mapleshore Golf Club/,
      render_inline(Themes::Parkland::FooterComponent.new(website: websites(:mapleshore))).to_html
    )
  end

  test "address is rendered when present and toggled on" do
    website = websites(:mapleshore)
    website.create_location(address_line_one: "1 Golf Road", locality: "Mapleshore", region: "Kent")

    assert_match(
      /1 Golf Road, Mapleshore, Kent/,
      render_inline(Themes::Parkland::FooterComponent.new(website: website)).to_html
    )
  end

  test "address is not rendered when not present" do
    website = websites(:mapleshore)

    refute_match(
      /1 Golf Road, Mapleshore, Kent/,
      render_inline(Themes::Parkland::FooterComponent.new(website: website)).to_html
    )
  end

  test "address is not rendered when toggled off" do
    website = websites(:mapleshore)
    website.create_location(address_line_one: "1 Golf Road", locality: "Mapleshore", region: "Kent")
    website.footer.update(display_address: false)

    refute_match(
      /1 Golf Road, Mapleshore, Kent/,
      render_inline(Themes::Parkland::FooterComponent.new(website: website)).to_html
    )
  end
end
