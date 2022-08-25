class Website < ApplicationRecord
  belongs_to :account

  validates :name, presence: true, uniqueness: true
  validates :subdomain, uniqueness: true, format: { with: /[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?/, message: "is invalid" }

  def host_url(platform_host)
    "https://#{subdomain}#{platform_host}"
  end
end