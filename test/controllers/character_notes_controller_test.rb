require "test_helper"

class CharacterNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get character_notes_index_url
    assert_response :success
  end

  test "should get new" do
    get character_notes_new_url
    assert_response :success
  end

  test "should get create" do
    get character_notes_create_url
    assert_response :success
  end

  test "should get show" do
    get character_notes_show_url
    assert_response :success
  end

  test "should get edit" do
    get character_notes_edit_url
    assert_response :success
  end

  test "should get update" do
    get character_notes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get character_notes_destroy_url
    assert_response :success
  end
end
