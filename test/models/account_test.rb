require "test_helper"

class AccountTest < ActiveSupport::TestCase
  def setup
    @account_name = "ACME Golf & Country Club"
    @subdomain = "acmegolf"
    @account = Account.new(name: @account_name)
  end

  test "should be valid with account name" do
    assert @account.valid?
  end

  test "should be invalid without account name" do
    refute Account.new.valid?
  end

  test "should be invalid with existing subdomain" do
    account = Account.new(name: "Drew Lang", subdomain: "drewlang")
    account.valid?

    assert_includes account.errors.full_messages, "Subdomain already exists"
    refute account.valid?
  end

  test "should build account and website" do
    account = Account.new_with_website({ name: @account_name, subdomain: @subdomain })

    assert_equal account.name, @account_name
    assert_equal account.websites.first.name, @account_name
    assert_equal account.websites.first.subdomain, @subdomain
  end
end