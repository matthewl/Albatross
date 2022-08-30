require "test_helper"

class SignUpTest < ActionDispatch::IntegrationTest
  test "can sign up an account" do
    get "https://www.lvh.me/sign_up"
    assert_response :success

    post "https://www.lvh.me/sign_up",
      params: {account: {name: "Oakridge Golf Club", subdomain: "oakridge"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Hi, welcome to the Oakridge Golf Club index page!"
  end
end
