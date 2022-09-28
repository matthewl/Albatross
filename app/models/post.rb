class Post < ApplicationRecord
  belongs_to :website

  validates :title, presence: true

  before_create :set_slug

  def set_slug
    return if slug.present?
    loop do
      self.slug = "#{title.parameterize}-#{SecureRandom.hex(4)}"
      break unless self.website.posts.exists?(slug: slug)
    end
  end
end
