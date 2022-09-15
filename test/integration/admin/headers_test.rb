require "test_helper"

class Admin::HeadersTest < ActionDispatch::IntegrationTest
  setup do
    host = "https://mapleshore.lvh.me"
    @admin_url = "#{host}/admin/headers/#{headers(:mapleshore_welcome).id}"
    @title = "Mapleshore GC"
    @sub_title = "Home of country golf"
    @welcome = "Greetings from"
  end

  test "can update the header's attributes" do
    get "#{@admin_url}/edit"
    put @admin_url, params: {header: {title: @title, sub_title: @sub_title, welcome: @welcome}}
    follow_redirect!

    get "#{@admin_url}/edit"

    assert_response :success
    assert_select "#header_title" do
      assert_select "[value=?]", @title
    end
    assert_select "#header_sub_title" do
      assert_select "[value=?]", @sub_title
    end
    assert_select "#header_welcome" do
      assert_select "[value=?]", @welcome
    end
  end
end
