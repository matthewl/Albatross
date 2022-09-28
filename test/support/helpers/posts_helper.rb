module PostsHelper
  extend ActiveSupport::Concern

  included do
    def header_attributes
      {}
    end

    def create_post(options = {})
      Post.create!(header_attributes.merge(options))
    end
  end
end
