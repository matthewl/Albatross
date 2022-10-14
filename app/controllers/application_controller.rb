class ApplicationController < ActionController::Base
  PROVIDER_DOMAIN = "www.albatross.com"
  add_flash_types :success, :error

  private

  def find_website
    @current_website = if subdomain_host?
      Website.find_sole_by(subdomain: request.subdomain)
    else
      Website.find_sole_by(url: request.host)
    end
  end

  def subdomain_host?
    return request.host.include?("lvh.me") if Rails.env.development? || Rails.env.test?
    return request.host != PROVIDER_DOMAIN && request.host.include?("albratrosscms.com") if Rails.env.production?
  end

  def platform_host
    return ".albatrosscms.com" if Rails.env.production?

    ".lvh.me"
  end
end
