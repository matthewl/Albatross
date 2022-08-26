require "test_helper"

class WebsiteTest < ActiveSupport::TestCase
  def setup
    @website_name = "ACME Golf & Country Club"
    @subdomain = "acmegolf"
    @website_params = { name: @website_name, subdomain: @subdomain }
    @website = Website.new(@website_params)
  end

  test "website is valid" do
    @website.account = accounts(:mapleshore_golf_club)
    assert @website.valid?
  end

  test "website is invalid without a website name" do
    refute Website.new(subdomain: @subdomain).valid?
  end

  test "website is invalid without a subdomain" do
    refute Website.new(name: @website_name).valid?
  end

  test "website is invalid with existing subdomain" do
    website = Website.new(name: "Drew Lang", subdomain: "drewlang")
    website.valid?

    assert_includes website.errors.full_messages, "Subdomain has already been taken"
    refute website.valid?
  end

  test "host_url returns url" do
    assert_equal @website.host_url(".lvh.me"), "https://acmegolf.lvh.me"
  end

  test "updates accounts name" do
    website = websites(:mapleshore)
    website.name = "Mapleshore Golf & Country Club"
    website.save

    assert_equal website.account.name, "Mapleshore Golf & Country Club"
  end

  test "does not update account name when more than one website exists" do
    account = accounts(:mapleshore_golf_club)
    website_params = { name: "Mapleshore Golf & Country Club", subdomain: "mapleshorecc" }
    website = account.websites.create(website_params)

    website.name = "Mapleshore Country Club"
    website.save

    assert_equal account.name, "Mapleshore Golf Club"
  end
end