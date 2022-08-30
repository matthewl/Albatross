# frozen_string_literal: true

class Admin::FormLabelComponent < ViewComponent::Base
  def initialize(form:, attribute:)
    @form = form
    @attribute = attribute
  end
end
