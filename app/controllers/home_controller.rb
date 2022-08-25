class HomeController < ApplicationController
  PROVIDER_DOMAIN = "www.albatross.com"

  def index
    if subdomain_host?
      @website = Website.find_sole_by(subdomain: request.subdomain)
    else
      @website = Website.find_sole_by(url: request.host)
    end
  end

  private

  def subdomain_host?
    return request.host.include?("lvh.me") if Rails.env.development? || Rails.env.test?
    return request.host != PROVIDER_DOMAIN && request.host.include?("albratrosscms.com") if Rails.env.production?
  end
end