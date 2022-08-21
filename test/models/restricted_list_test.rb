require 'test_helper'

class RestrictedListTest < ActiveSupport::TestCase
  test 'retrieve_ips' do
    assert_includes RestrictedList.retrieve_ips, 'www.lvh.me'
  end
end