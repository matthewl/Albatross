class Enquiry < ApplicationRecord
  enum enquiry_type: {
    general_enquiry: "general_enquiry"
  }

  enum status: {
    open: "open",
    closed: "closed"
  }

  # Use content id to redirect back after submitting enquiry.
  attr_accessor :source_content_id

  belongs_to :enquiry_form
  belongs_to :website

  def enquiry_description
    enquiry_form.title
  end

  def self.title_options
    [
      %w[Mr Mr],
      %w[Mrs Mrs],
      %w[Miss Miss],
      %w[Ms Ms],
      %w[Dr Dr]
    ]
  end

  def self.enquiry_type_options
    enquiry_types.map { |k, v| [k.humanize, v] }
  end
end
