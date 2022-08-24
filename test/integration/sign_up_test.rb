require "test_helper"

class SignUpTest < ActionDispatch::IntegrationTest
  test "can sign up an account" do
    get "https://www.lvh.me/sign_up"
    assert_response :success

    post "https://www.lvh.me/sign_up",
      params: { account: { name: "ACME Golf & Country Club", subdomain: "acme-golf" } }
    assert_response :redirect

    # follow_redirect!
    # assert_response :success
    # assert_select "p", "Title:\n  can create"
  end
end
