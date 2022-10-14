require "test_helper"

class HomeTest < ActionDispatch::IntegrationTest
  setup do
    @host = "https://mapleshore.lvh.me"
  end

  test "can navigate to the home page of a website" do
    get "#{@host}/"
    assert_response :success
  end

  test "can navigate to the marketing home page" do
    get "https://www.lvh.me/"
    assert_response :success
  end
end
