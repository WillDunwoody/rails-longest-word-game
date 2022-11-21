require "application_system_test_case"

class LongestWordsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit new_url

    assert_selector "h1", text: "Longest Word"
  end

  # test "saying Hello yields a grumpy response from the coach" do
  #   visit ask_url
  #   fill_in "question", with: "Hello"
  #   click_on "Ask"

  #   assert_text "I don't care, get dressed and go to work!"
  # end
end
