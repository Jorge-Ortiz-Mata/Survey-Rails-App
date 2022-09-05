require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get questions_create_url
    assert_response :success
  end

  test "should get update" do
    get questions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get questions_destroy_url
    assert_response :success
  end
end
