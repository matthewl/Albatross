require "test_helper"

class PostTest < ActiveSupport::TestCase
  include PostsHelper

  def setup
    @post = posts(:mapleshore_hello_world)
  end

  class ValidationTest < PostTest
    test "post is valid" do
      assert @post.valid?
    end

    test "post is invalid without a title" do
      refute Post.new.valid?
    end
  end

  class CallbackTest < PostTest
    test "creating a post sets the slug" do
      post = Post.create(website: websites(:mapleshore), title: "Hello World")
      assert_match(/hello-world-[a-fA-F0-9]{8}/, post.slug)
    end

    test "creating a post generates a unique slug" do
      previous_post = Post.create(website: websites(:mapleshore), title: "Hello World")
      new_post = Post.create(website: websites(:mapleshore), title: "Hello World")

      refute_equal previous_post.slug, new_post.slug
    end
  end
end
