class ApplicationController < ActionController::Base
  add_flash_types :success, :error

  private

  def platform_host
    return ".albatrosscms.com" if Rails.env.production?

    ".lvh.me"
  end

  def find_website
    # TODO: Improve guard for production environment.
    if request.host.include?("lvh.me")
      @current_website = Website.find_sole_by(subdomain: request.subdomain)
    end
  end
end
