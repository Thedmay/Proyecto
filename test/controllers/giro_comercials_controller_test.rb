require 'test_helper'

class GiroComercialsControllerTest < ActionController::TestCase
  setup do
    @giro_comercial = giro_comercials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:giro_comercials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create giro_comercial" do
    assert_difference('GiroComercial.count') do
      post :create, giro_comercial: { nombre: @giro_comercial.nombre }
    end

    assert_redirected_to giro_comercial_path(assigns(:giro_comercial))
  end

  test "should show giro_comercial" do
    get :show, id: @giro_comercial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @giro_comercial
    assert_response :success
  end

  test "should update giro_comercial" do
    patch :update, id: @giro_comercial, giro_comercial: { nombre: @giro_comercial.nombre }
    assert_redirected_to giro_comercial_path(assigns(:giro_comercial))
  end

  test "should destroy giro_comercial" do
    assert_difference('GiroComercial.count', -1) do
      delete :destroy, id: @giro_comercial
    end

    assert_redirected_to giro_comercials_path
  end
end
