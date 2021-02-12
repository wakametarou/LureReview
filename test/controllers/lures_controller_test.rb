require 'test_helper'

class LuresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lures_index_url
    assert_response :success
  end

  test "should get show" do
    get lures_show_url
    assert_response :success
  end

end
