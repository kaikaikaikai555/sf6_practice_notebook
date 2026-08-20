require "test_helper"

class CharacterNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get character_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_character_note_url
    assert_response :success
  end
end
