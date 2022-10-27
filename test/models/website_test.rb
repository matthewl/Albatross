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

    test "website is invalid with long banner text" do
      @website.banner_enabled = true
      @website.banner_text = "a" * 76

      refute @website.valid?
      assert_includes @website.errors.full_messages, "Banner text is too long (maximum is 75 characters)"
    end

    test "banner length validation skipped when banner disabled" do
      @website.banner_text = "a" * 76
      @website.account = accounts(:mapleshore_golf_club)

      assert @website.valid?
    end

    test "website is invalid with a past banner expiration date" do
      @website.banner_enabled = true
      @website.banner_expires_at = Date.yesterday

      refute @website.valid?
      assert_includes @website.errors.full_messages, "Banner expiration date can't be in the past"
    end

    test "banner expiration validation skipped when banner disabled" do
      @website.banner_expires_at = Date.yesterday
      @website.account = accounts(:mapleshore_golf_club)

      assert @website.valid?
    end
  end

  class CallbacksTest < WebsiteTest
    test "before_create sets the default theme" do
      website = Website.new(@website_params)
      website.account = accounts(:mapleshore_golf_club)
      website.save

      assert_equal "parkland", website.theme
    end

    test "after_create creates a single header" do
      website = Website.new(@website_params)
      website.account = accounts(:mapleshore_golf_club)
      website.save

      assert_equal 1, website.headers.count
      assert_equal "ACME Golf & Country Club", website.headers.first.title
      assert_equal "Welcome to", website.headers.first.welcome
      assert_equal "Website under construction", website.headers.first.sub_title
    end

    test "after_create creates a single footer" do
      website = Website.new(@website_params)
      website.account = accounts(:mapleshore_golf_club)
      website.save

      assert_equal false, website.footer.display_address
      assert_equal true, website.footer.display_copyright
    end

    test "after_create creates a single default enquiry form" do
      website = Website.new(@website_params)
      website.account = accounts(:mapleshore_golf_club)
      website.save

      assert_equal 1, website.enquiry_forms.count
      assert website.enquiry_forms.first.default_form
      assert "General enquiry", website.enquiry_forms.first.title
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
    test "display_banner? returns true" do
      @website.account = accounts(:mapleshore_golf_club)
      @website.banner_enabled = true
      @website.banner_expires_at = Date.tomorrow
      @website.banner_text = "Some major announcement"

      assert @website.display_banner?
    end

    test "display_banner? returns false" do
      @website.account = accounts(:mapleshore_golf_club)
      @website.banner_expires_at = Date.tomorrow
      @website.banner_text = "Some major announcement"

      refute @website.display_banner?

      @website.banner_enabled = true
      @website.banner_expires_at = Date.yesterday

      refute @website.display_banner?

      @website.banner_enabled = true
      @website.banner_expires_at = Date.tomorrow
      @website.banner_text = ""

      refute @website.display_banner?
    end

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
