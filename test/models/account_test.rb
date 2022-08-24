require "test_helper"

class AccountTest < ActiveSupport::TestCase
  def setup
    @account_name = "ACME Golf & Country Club"
    @subdomain = "acmegolf"
    @account_params = { name: @account_name, subdomain: @subdomain }
    @account = Account.new(@account_params)
  end

  test "account is valid" do
    assert @account.valid?
  end

  test "account is invalid without an account name" do
    refute Account.new(subdomain: @subdomain).valid?
  end

  test "account is invalid without a subdomain" do
    refute Account.new(name: @account_name).valid?
  end

  test "account is invalid with existing subdomain" do
    account = Account.new(name: "Drew Lang", subdomain: "drewlang")
    account.valid?

    assert_includes account.errors.full_messages, "Subdomain already exists"
    refute account.valid?
  end

  test "build account and website" do
    account = Account.new_with_website(@account_params)

    assert_equal account.name, @account_name
    assert_equal account.websites.first.name, @account_name
    assert_equal account.websites.first.subdomain, @subdomain
  end
end