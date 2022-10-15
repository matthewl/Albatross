require "test_helper"

class Admin::FooterTest < ActionDispatch::IntegrationTest
  setup do
    host = "https://mapleshore.lvh.me"
    @admin_url = "#{host}/admin/footers"
  end

  test "can update the footer's attributes" do
    get "#{@admin_url}/edit"
    assert_response :success

    put @admin_url, params: {footer: {display_address: false, display_copyright: false}}
    follow_redirect!

    get "#{@admin_url}/edit"

    assert_response :success
    assert_select "#footer_display_address" do
      assert_select "[value=?]", "false"
    end
    assert_select "#footer_display_copyright" do
      assert_select "[value=?]", "false"
    end
  end
end
