class Post < ApplicationRecord
  belongs_to :website

  validates :title, presence: true
end