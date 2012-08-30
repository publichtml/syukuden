require 'test_helper'

class LowerPhrasesControllerTest < ActionController::TestCase
  setup do
    @lower_phrase = lower_phrases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lower_phrases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lower_phrase" do
    assert_difference('LowerPhrase.count') do
      post :create, lower_phrase: { available: @lower_phrase.available, content: @lower_phrase.content, deleted: @lower_phrase.deleted }
    end

    assert_redirected_to lower_phrase_path(assigns(:lower_phrase))
  end

  test "should show lower_phrase" do
    get :show, id: @lower_phrase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lower_phrase
    assert_response :success
  end

  test "should update lower_phrase" do
    put :update, id: @lower_phrase, lower_phrase: { available: @lower_phrase.available, content: @lower_phrase.content, deleted: @lower_phrase.deleted }
    assert_redirected_to lower_phrase_path(assigns(:lower_phrase))
  end

  test "should destroy lower_phrase" do
    assert_difference('LowerPhrase.count', -1) do
      delete :destroy, id: @lower_phrase
    end

    assert_redirected_to lower_phrases_path
  end
end
