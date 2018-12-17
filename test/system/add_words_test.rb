require "application_system_test_case"

class AddWordsTest < ApplicationSystemTestCase
  setup do
    @add_word = add_words(:one)
  end

  test "visiting the index" do
    visit add_words_url
    assert_selector "h1", text: "Add Words"
  end

  test "creating a Add word" do
    visit add_words_url
    click_on "New Add Word"

    fill_in "Meaning", with: @add_word.meaning
    fill_in "Pinyin", with: @add_word.pinyin
    fill_in "Word", with: @add_word.word
    click_on "Create Add word"

    assert_text "Add word was successfully created"
    click_on "Back"
  end

  test "updating a Add word" do
    visit add_words_url
    click_on "Edit", match: :first

    fill_in "Meaning", with: @add_word.meaning
    fill_in "Pinyin", with: @add_word.pinyin
    fill_in "Word", with: @add_word.word
    click_on "Update Add word"

    assert_text "Add word was successfully updated"
    click_on "Back"
  end

  test "destroying a Add word" do
    visit add_words_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Add word was successfully destroyed"
  end
end
