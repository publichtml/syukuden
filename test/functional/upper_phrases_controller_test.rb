require 'test_helper'

class UpperPhrasesControllerTest < ActionController::TestCase
  setup do
    @upper_phrase = upper_phrases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:upper_phrases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upper_phrase" do
    assert_difference('UpperPhrase.count') do
      post :create, upper_phrase: { available: @upper_phrase.available, content: @upper_phrase.content, deleted: @upper_phrase.deleted }
    end

    assert_redirected_to upper_phrase_path(assigns(:upper_phrase))
  end

  test "should show upper_phrase" do
    get :show, id: @upper_phrase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @upper_phrase
    assert_response :success
  end

  test "should update upper_phrase" do
    put :update, id: @upper_phrase, upper_phrase: { available: @upper_phrase.available, content: @upper_phrase.content, deleted: @upper_phrase.deleted }
    assert_redirected_to upper_phrase_path(assigns(:upper_phrase))
  end

  test "should destroy upper_phrase" do
    assert_difference('UpperPhrase.count', -1) do
      delete :destroy, id: @upper_phrase
    end

    assert_redirected_to upper_phrases_path
  end
end
