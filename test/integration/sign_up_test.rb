require "test_helper"

class SignUpTest < ActionDispatch::IntegrationTest
  test "can sign up an account" do
    get "https://www.test.localhost/sign_up"
    assert_response :success

    post "https://www.test.localhost/sign_up",
      params: {account: {name: "Oakridge Golf Club", subdomain: "oakridge"}}
    assert_response :redirect

    follow_redirect!
    assert_response :success
    assert_select "h1", "Oakridge Golf Club"
  end
end
