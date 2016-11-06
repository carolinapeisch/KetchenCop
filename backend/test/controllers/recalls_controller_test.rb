require 'test_helper'

class RecallsControllerTest < ActionController::TestCase
  setup do
    @recall = recalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recall" do
    assert_difference('Recall.count') do
      post :create, recall: { contact_id: @recall.contact_id, date: @recall.date, level_id: @recall.level_id, product_id: @recall.product_id, reason: @recall.reason, region_id: @recall.region_id }
    end

    assert_redirected_to recall_path(assigns(:recall))
  end

  test "should show recall" do
    get :show, id: @recall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recall
    assert_response :success
  end

  test "should update recall" do
    patch :update, id: @recall, recall: { contact_id: @recall.contact_id, date: @recall.date, level_id: @recall.level_id, product_id: @recall.product_id, reason: @recall.reason, region_id: @recall.region_id }
    assert_redirected_to recall_path(assigns(:recall))
  end

  test "should destroy recall" do
    assert_difference('Recall.count', -1) do
      delete :destroy, id: @recall
    end

    assert_redirected_to recalls_path
  end
end
