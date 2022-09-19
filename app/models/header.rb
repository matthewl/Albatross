class Header < ApplicationRecord
  belongs_to :website

  has_one_attached :background_image

  validates :title, presence: true
  validates :welcome, presence: true
  validates :background_image, content_type: ["image/png", "image/jpeg", "image/jpg"], max_file_size: 10.megabytes

  def self.active_header_with_background?
    first && first.background_image.attached?
  end
end
