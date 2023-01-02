require "application_system_test_case"

class LongestWordsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit new_url

    assert_selector "h1", text: "Longest Word"
  end

  test "filling in form redirects to score page" do
    visit new_url

    fill_in 'answer', with: 'trying'
    click_on 'Check!'

    assert_text 'Result'
  end

  test "get message when word is not in dictionary" do
    visit new_url

    fill_in 'answer', with: 'asfkaskf'
    click_on 'Check!'

    assert_text 'Sorry, Asfkaskf is not in the dictionary'
  end

  test 'get message when word is correct' do
    visit new_url

    fill_in 'answer', with: 'hi'
    click_on 'Check!'

    assert_text 'Congratulations! Hi is correct!'
  end
end
