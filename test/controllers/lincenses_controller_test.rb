require 'test_helper'

class LincensesControllerTest < ActionController::TestCase
  setup do
    @lincense = lincenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lincenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lincense" do
    assert_difference('Lincense.count') do
      post :create, lincense: { detalle: @lincense.detalle, duracion: @lincense.duracion, employee_id: @lincense.employee_id, fechaInicio: @lincense.fechaInicio }
    end

    assert_redirected_to lincense_path(assigns(:lincense))
  end

  test "should show lincense" do
    get :show, id: @lincense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lincense
    assert_response :success
  end

  test "should update lincense" do
    patch :update, id: @lincense, lincense: { detalle: @lincense.detalle, duracion: @lincense.duracion, employee_id: @lincense.employee_id, fechaInicio: @lincense.fechaInicio }
    assert_redirected_to lincense_path(assigns(:lincense))
  end

  test "should destroy lincense" do
    assert_difference('Lincense.count', -1) do
      delete :destroy, id: @lincense
    end

    assert_redirected_to lincenses_path
  end
end
