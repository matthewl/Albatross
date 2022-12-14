require "test_helper"

class HomeTest < ActionDispatch::IntegrationTest
  setup do
    @host = "https://mapleshore.test.localhost"
  end

  test "can navigate to the home page of a website" do
    get "#{@host}/"
    assert_response :success
  end

  test "can navigate to the marketing home page" do
    get "https://mapleshore.test.localhost"
    assert_response :success
  end
end
