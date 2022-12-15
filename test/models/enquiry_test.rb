require "test_helper"

class EnquiryTest < ActiveSupport::TestCase
  def setup
    @enquiry_form = enquiry_forms(:mapleshore_enquiry_form_default)
    @website = websites(:mapleshore)
    params = {
      enquiry_form: @enquiry_form,
      website: @website
    }

    @enquiry = Enquiry.new(params)
  end

  test "returns the title of the enquiry form as the description" do
    assert_equal "Default Enquiry Form", @enquiry.enquiry_description
  end
end
