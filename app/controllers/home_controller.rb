class HomeController < ApplicationController
  PROVIDER_DOMAIN = "www.albatross.com"

  def index
    @website = if subdomain_host?
      Website.find_sole_by(subdomain: request.subdomain)
    else
      Website.find_sole_by(url: request.host)
    end

    render @website.home_view_path, layout: @website.layout_path
  end

  private

  def subdomain_host?
    return request.host.include?("lvh.me") if Rails.env.development? || Rails.env.test?
    return request.host != PROVIDER_DOMAIN && request.host.include?("albratrosscms.com") if Rails.env.production?
  end
end
