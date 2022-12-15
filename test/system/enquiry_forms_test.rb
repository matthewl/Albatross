require "application_system_test_case"

class EnquiryFormsTest < ApplicationSystemTestCase
  test "submitting an enquiry" do
    visit root_url

    assert_selector "h1", text: "Mapleshore Golf Club"
  end
end
