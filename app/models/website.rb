class Website < ApplicationRecord
  belongs_to :account

  has_one :location, as: :locatable, dependent: :destroy
  accepts_nested_attributes_for :location

  validates :name, presence: true, uniqueness: true
  validates :subdomain, uniqueness: true, format: { with: /[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?/, message: "is invalid" }

  after_update :update_account_name

  def host_url(platform_host)
    "https://#{subdomain}#{platform_host}"
  end

  private

  def update_account_name
    if account.websites.count == 1 && account.name != name
      account.update_attribute(:name, name)
    end
  end
end