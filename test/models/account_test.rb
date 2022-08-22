require "test_helper"

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = Account.new(name: "ACME Golf & Country Club")
  end

  test "should be valid with account name" do
    assert @account.valid?
  end

  test "shuld be invalid without account name" do
    refute Account.new.valid?
  end
end