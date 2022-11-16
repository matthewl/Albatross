# frozen_string_literal: true

class Themes::Links::EnquiryFormComponent < ViewComponent::Base
  def initialize(website:)
    @website = website
    @enquiry_form = @website.default_enquiry_form
  end

  def render?
    @enquiry_form.present?
  end
end
