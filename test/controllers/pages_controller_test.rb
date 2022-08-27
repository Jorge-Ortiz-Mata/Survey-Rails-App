require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get landing_page" do
    get pages_landing_page_url
    assert_response :success
  end
end
