class Website < ApplicationRecord
  DEFAULT_THEME = "parkland"

  belongs_to :account

  has_many :headers, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one :location, as: :locatable, dependent: :destroy
  accepts_nested_attributes_for :location

  validates :banner_text, length: {maximum: 75}, if: proc { |w| w.banner_enabled? }
  validates :name, presence: true, uniqueness: true
  validates :subdomain, uniqueness: true, format: {with: /[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?/, message: "is invalid"}
  validate :banner_expiration_date_cannot_be_in_the_past

  after_create :create_header
  after_update :update_account_name

  before_create do
    self.theme = DEFAULT_THEME
  end

  def display_banner?
    banner_enabled? && banner_expires_at > DateTime.now && banner_text.present?
  end

  def home_view_path
    "themes/#{current_or_default_theme}/home"
  end

  def host_url(platform_host)
    "https://#{subdomain}#{platform_host}"
  end

  def layout_path
    "themes/#{current_or_default_theme}"
  end

  def themes
    [
      ["Links", "links"],
      ["Parkland", "parkland"],
      ["Desert", "desert"]
    ]
  end

  private

  def current_or_default_theme
    theme.blank? ? DEFAULT_THEME : theme
  end

  def create_header
    headers.create(
      title: name,
      welcome: "Welcome to",
      sub_title: "Website under construction"
    )
  end

  def update_account_name
    if account.websites.count == 1 && account.name != name
      account.update_attribute(:name, name)
    end
  end

  def banner_expiration_date_cannot_be_in_the_past
    if banner_enabled? && banner_expires_at.present? && banner_expires_at < Date.today
      errors.add(:banner_expires_at, "can't be in the past")
    end
  end
end
