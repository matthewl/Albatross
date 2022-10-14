# frozen_string_literal: true

class Themes::Links::RecentPostsComponent < ViewComponent::Base
  LIMIT = 6
  TRUNCATE_LENGTH = 200

  def initialize(website:)
    @website = website
    @posts = @website.posts.order(created_at: :desc).limit(LIMIT)
  end

  def truncate_length
    TRUNCATE_LENGTH
  end

  def title
    "The latest news"
  end

  def sub_title
    "All the latest news from #{@website.name} Golf Club"
  end
end
