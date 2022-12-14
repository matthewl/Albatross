require "test_helper"

class Admin::EnquiriesTest < ActionDispatch::IntegrationTest
  setup do
    host = "https://mapleshore.test.localhost"
    @admin_url = "#{host}/admin/enquiries"
  end

  test "can view an enquiry" do

  end
end
