require "test_helper"

class HeaderTest < ActiveSupport::TestCase
  include HeadersHelper

  def setup
    @header = headers(:mapleshore_welcome)
    @title = "ACME Golf & Country Club"
    @sub_title = "Home of country golf"
  end

  class ValidationTest < HeaderTest
    test "header is valid" do
      assert @header.valid?
    end

    test "header is invalid without a title" do
      refute Header.new(sub_title: @sub_title).valid?
    end

    test "header is invalid without a sub_title" do
      refute Header.new(title: @title).valid?
    end

    test "accepts background images of valid file formats" do
      valid_formats = %w[image/png image/jpeg image/jpg]

      valid_formats.each do |file_format|
        @header.background_image.stub :content_type, file_format do
          assert @header.valid?, "#{@header.errors.full_messages} should be a valid"
        end
      end
    end

    test "rejects background images of invalid file formats" do
      invalid_formats = %w[image/bmp video/mp4]

      invalid_formats.each do |file_format|
        @header.background_image.stub :content_type, file_format do
          refute @header.valid?, "#{file_format} should be an invalid format"
        end
      end
    end

    test "should enforce a maximum cover image file size" do
      @header.background_image.blob.stub :byte_size, 11.megabytes do
        refute @header.valid?
      end
    end
  end

  test "returns true if the active header has a background image" do
    website = websites(:mapleshore)
    assert_equal true, website.headers.active_header_with_background?
  end

  test "returns false if the active header does not have a background image" do
    website = websites(:drew_lang)
    assert_equal false, website.headers.active_header_with_background?
  end
end
