module HeadersHelper
  extend ActiveSupport::Concern

  included do
    def header_attributes
      {}
    end

    def create_header(options = {})
      Header.create!(header_attributes.merge(options))
    end
  end
end
