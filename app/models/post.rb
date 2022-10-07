class Post < ApplicationRecord
  belongs_to :website

  validates :title, presence: true

  has_rich_text :content

  before_create :set_slug

  def self.statuses
    [
      ["Draft - not ready for publishing", "draft"],
      ["Publish - ready to be published", "publish"]
    ]
  end

  def set_slug
    return if slug.present?
    loop do
      self.slug = "#{title.parameterize}-#{SecureRandom.hex(4)}"
      break unless self.website.posts.exists?(slug: slug)
    end
  end
end
