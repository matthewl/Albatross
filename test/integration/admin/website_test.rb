require "test_helper"

class Admin::WebsiteTest < ActionDispatch::IntegrationTest
  setup do
    host = "https://mapleshore.lvh.me"
    @admin_url = "#{host}/admin/websites/#{websites(:mapleshore).id}"
    @website_name = "Mapleshore Country Club"
  end

  test "can update the website name" do
    get "#{@admin_url}/edit"
    put @admin_url, params: {website: {name: @website_name}}
    follow_redirect!

    get "#{@admin_url}/edit"
    assert_response :success
    assert_select "#website_name" do
      assert_select "[value=?]", @website_name
    end
  end

  test "can update the website location" do
    location_params = {
      address_line_one: "63 Main Road",
      locality: "Elderslie",
      post_code: "PA5 9AZ"
    }

    get "#{@admin_url}/edit"
    params = {
      website: {
        name: @website_name,
        location_attributes: location_params
      }
    }

    put @admin_url, params: params
    follow_redirect!

    get "#{@admin_url}/edit"
    assert_response :success

    assert_select "#website_location_attributes_address_line_one" do
      assert_select "[value=?]", location_params[:address_line_one]
    end

    assert_select "#website_location_attributes_locality" do
      assert_select "[value=?]", location_params[:locality]
    end

    assert_select "#website_location_attributes_post_code" do
      assert_select "[value=?]", location_params[:post_code]
    end
  end
end
