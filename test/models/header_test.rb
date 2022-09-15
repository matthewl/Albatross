require "test_helper"

class HeaderTest < ActiveSupport::TestCase
  def setup
    @title = "ACME Golf & Country Club"
    @sub_title = "Home of country golf"
  end

  class ValidationTest < HeaderTest
    test "header is valid" do
      @header = headers(:mapleshore_welcome)
      assert @header.valid?
    end

    test "header is invalid without a title" do
      refute Header.new(sub_title: @sub_title).valid?
    end

    test "header is invalid without a sub_title" do
      refute Header.new(title: @title).valid?
    end
  end
end
