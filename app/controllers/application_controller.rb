class ApplicationController < ActionController::Base

  private

  def platform_host
    return ".albatrosscms.com" if Rails.env.production?

    ".lvh.me"
  end
end
