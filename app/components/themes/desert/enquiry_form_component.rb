# frozen_string_literal: true

class Themes::Desert::EnquiryFormComponent < ViewComponent::Base
  def initialize(website:)
    @website = website
    @enquiry_form = @website.default_enquiry_form
  end

  def render?
    @enquiry_form.present? && @enquiry_form.active?
  end
end
