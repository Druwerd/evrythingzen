require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  setup do
    @user = users(:contributor)
    @quote = quotes(:one)
    login(@user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quote)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post :create, quote: { source_link: @quote.source_link, source: @quote.source, text: @quote.text, zen_link: @quote.zen_link }
    end

    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should show quote" do
    get :show, id: @quote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quote
    assert_response :success
  end

  test "should update quote" do
    patch :update, id: @quote, quote: { source_link: @quote.source_link, source: @quote.source, text: @quote.text, zen_link: @quote.zen_link }
    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete :destroy, id: @quote
    end

    assert_redirected_to quotes_path
  end
end
