require "test_helper"

class MatchLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get match_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_match_log_url
    assert_response :success
  end
end