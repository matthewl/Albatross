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

  # TODO: Extract hard-coded subdomains into the credentials file.
  def subdomain_host?
    return request.host.include?("dev.localhost") if Rails.env.development?
    return request.host.include?("test.localhost") if Rails.env.test?
    return request.host != PROVIDER_DOMAIN && request.host.include?("albratrosscms.com") if Rails.env.production?
  end

  # TODO: Extract hard-coded subdomains into the credentials file.
  def platform_host
    return ".albatrosscms.com" if Rails.env.production?
    return ".test.localhost" if Rails.env.test?

    ".dev.localhost" if Rails.env.development?
  end
end
