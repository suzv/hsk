require 'test_helper'

class AddWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @add_word = add_words(:one)
  end

  test "should get index" do
    get add_words_url
    assert_response :success
  end

  test "should get new" do
    get new_add_word_url
    assert_response :success
  end

  test "should create add_word" do
    assert_difference('AddWord.count') do
      post add_words_url, params: { add_word: { meaning: @add_word.meaning, pinyin: @add_word.pinyin, word: @add_word.word } }
    end

    assert_redirected_to add_word_url(AddWord.last)
  end

  test "should show add_word" do
    get add_word_url(@add_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_add_word_url(@add_word)
    assert_response :success
  end

  test "should update add_word" do
    patch add_word_url(@add_word), params: { add_word: { meaning: @add_word.meaning, pinyin: @add_word.pinyin, word: @add_word.word } }
    assert_redirected_to add_word_url(@add_word)
  end

  test "should destroy add_word" do
    assert_difference('AddWord.count', -1) do
      delete add_word_url(@add_word)
    end

    assert_redirected_to add_words_url
  end
end
