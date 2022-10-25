require "test_helper"

class EnquiryTest < ActionDispatch::IntegrationTest
  setup do
    @host = "https://mapleshore.lvh.me"
  end

  test "can render the enquiry form on the website" do
    get "#{@host}/"
    assert_response :success
  end

  test "can submit an enquiry to the website" do
  end
end
