require "test_helper"

class PostsTest < ActionDispatch::IntegrationTest
  setup do
    @host = "https://mapleshore.lvh.me"
  end

  test "an existing post" do
    get "#{@host}/posts/hello-world-12345"
    assert_response :success
  end

  test "a post that doesn't exist" do
    get "https://drewlang.lvh.me/posts/hello-world-12345"
    assert_response :not_found
  end
end
