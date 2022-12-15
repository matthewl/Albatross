require "test_helper"

class Admin::PostsTest < ActionDispatch::IntegrationTest
  setup do
    host = "https://mapleshore.test.localhost"
    @admin_url = "#{host}/admin/posts"
  end

  test "can create a new post" do
    title = "November sale"

    get "#{@admin_url}/new"
    assert_response :success

    post @admin_url, params: {post: {title: title, status: "published", content: "This is a test"}}
    assert_equal "Post created successfully", flash[:success]
    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select "tr#post_#{Post.last.id}" do
      assert_select "td#post_#{Post.last.id}_title", title
      assert_select "td#post_#{Post.last.id}_status", "published"
    end
  end

  test "can update an existing post" do
    title = "January sale"
    status = "published"
    content = "This is a test"
    post_id = posts(:mapleshore_hello_world).id

    get "#{@admin_url}/#{post_id}/edit"
    assert_response :success

    put "#{@admin_url}/#{post_id}", params: {post: {title: title, status: status, content: content}}
    assert_equal "Post updated successfully", flash[:success]
    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select "tr#post_#{post_id}" do
      assert_select "td#post_#{post_id}_title", title
      assert_select "td#post_#{post_id}_status", status
    end
  end

  test "can delete an existing post" do
    assert_difference("Post.count", -1) do
      delete "#{@admin_url}/#{posts(:mapleshore_hello_world).id}"
    end
    assert_equal "Post deleted successfully", flash[:success]
  end
end
