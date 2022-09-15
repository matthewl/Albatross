class Header < ApplicationRecord
  belongs_to :website

  validates :title, presence: true
  validates :welcome, presence: true
end
