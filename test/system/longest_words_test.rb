require "application_system_test_case"

class LongestWordsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit new_url

    assert_selector "h1", text: "Longest Word"
  end

  test "saying Hello yields a grumpy response from the coach" do
    get "/new"
    assert_response :success

    post '/score',
    params: { letters: ["H", "I"], answer: "Hi" }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_text "Congratulations"
  end
end
