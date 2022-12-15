require "test_helper"

class EnquiryFormTest < ActiveSupport::TestCase
  def setup
    @enquiry_form = enquiry_forms(:mapleshore_enquiry_form_default)
  end

  class InstanceTest < EnquiryFormTest
    test "sets the enquiry form as the default" do
      enquiry_form = enquiry_forms(:mapleshore_enquiry_form_lesson)
      enquiry_form.set_as_default

      assert enquiry_form.default_form?
      refute EnquiryForm.find(enquiry_forms(:mapleshore_enquiry_form_default).id).default_form?
    end
  end

  class ValidationTest < EnquiryFormTest
    test "post is valid" do
      assert @enquiry_form.valid?
    end

    test "post is invalid without a title" do
      refute EnquiryForm.new.valid?
    end
  end
end
