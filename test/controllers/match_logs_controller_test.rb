require "test_helper"

class MatchLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get match_logs_index_url
    assert_response :success
  end

  test "should get new" do
    get match_logs_new_url
    assert_response :success
  end

  test "should get create" do
    get match_logs_create_url
    assert_response :success
  end
end
