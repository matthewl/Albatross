class EnquiryForm < ApplicationRecord
  belongs_to :website

  validates :title, presence: true

  def set_as_default
    website.enquiry_forms.each { |e| e.update_attribute(:default_form, false) }
    self.default_form = true
    save
  end
end
