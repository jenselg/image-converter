require 'test_helper'

class ConvertImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @convert_image = convert_images(:one)
  end

  test "should get index" do
    get convert_images_url
    assert_response :success
  end

  test "should get new" do
    get new_convert_image_url
    assert_response :success
  end

  test "should create convert_image" do
    assert_difference('ConvertImage.count') do
      post convert_images_url, params: { convert_image: { access_key: @convert_image.access_key, data: @convert_image.data } }
    end

    assert_redirected_to convert_image_url(ConvertImage.last)
  end

  test "should show convert_image" do
    get convert_image_url(@convert_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_convert_image_url(@convert_image)
    assert_response :success
  end

  test "should update convert_image" do
    patch convert_image_url(@convert_image), params: { convert_image: { access_key: @convert_image.access_key, data: @convert_image.data } }
    assert_redirected_to convert_image_url(@convert_image)
  end

  test "should destroy convert_image" do
    assert_difference('ConvertImage.count', -1) do
      delete convert_image_url(@convert_image)
    end

    assert_redirected_to convert_images_url
  end
end
