class Account < ApplicationRecord
  attr_accessor :subdomain

  has_many :websites, validate: false

  validates :name, presence: true, uniqueness: true
  validates :subdomain, format: {with: /[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?/, message: "is invalid"}
  validate :subdomain_is_unique

  def self.new_with_website(account_params)
    account = Account.new(account_params)
    account.websites.build(name: account.name, subdomain: account.subdomain)

    account
  end

  def subdomain_is_unique
    if subdomain.present? && Website.find_by(subdomain: subdomain).present?
      errors.add(:subdomain, "has already been taken")
    end
  end
end
