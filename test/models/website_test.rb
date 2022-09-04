require "test_helper"

class WebsiteTest < ActiveSupport::TestCase
  def setup
    @website_name = "ACME Golf & Country Club"
    @subdomain = "acmegolf"
    @website_params = {name: @website_name, subdomain: @subdomain}
    @website = Website.new(@website_params)
  end

  class ValidationTest < WebsiteTest
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
  end

  class CallbacksTest < WebsiteTest
    test "before_create sets the default theme" do
      website = Website.new(@website_params)
      website.account = accounts(:mapleshore_golf_club)
      website.save

      assert_equal "parkland", website.theme
    end

    test "after_update updates accounts name" do
      website = websites(:mapleshore)
      website.name = "Mapleshore Golf & Country Club"
      website.save

      assert_equal website.account.name, "Mapleshore Golf & Country Club"
    end

    test "after_update does not update account name when more than one website exists" do
      account = accounts(:mapleshore_golf_club)
      website_params = {name: "Mapleshore Golf & Country Club", subdomain: "mapleshorecc"}
      website = account.websites.create(website_params)

      website.name = "Mapleshore Country Club"
      website.save

      assert_equal account.name, "Mapleshore Golf Club"
    end
  end

  class InstanceTest < WebsiteTest
    test "host_url returns url" do
      assert_equal @website.host_url(".lvh.me"), "https://acmegolf.lvh.me"
    end

    test "home_view_path returns default theme" do
      assert_equal "themes/parkland/home", @website.home_view_path
    end

    test "home_view_path returns selected theme" do
      @website.theme = "links"
      assert_equal "themes/links/home", @website.home_view_path
    end

    test "layout_path returns default theme" do
      assert_equal "themes/parkland", @website.layout_path
    end

    test "layout_path returns selected theme" do
      @website.theme = "links"
      assert_equal "themes/links", @website.layout_path
    end
  end
end
