require 'test_helper'

class LicenciaControllerTest < ActionController::TestCase
  setup do
    @licencium = licencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create licencium" do
    assert_difference('Licencium.count') do
      post :create, licencium: { detalle: @licencium.detalle, duracion: @licencium.duracion, employee_id: @licencium.employee_id, fechaInicio: @licencium.fechaInicio }
    end

    assert_redirected_to licencium_path(assigns(:licencium))
  end

  test "should show licencium" do
    get :show, id: @licencium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @licencium
    assert_response :success
  end

  test "should update licencium" do
    patch :update, id: @licencium, licencium: { detalle: @licencium.detalle, duracion: @licencium.duracion, employee_id: @licencium.employee_id, fechaInicio: @licencium.fechaInicio }
    assert_redirected_to licencium_path(assigns(:licencium))
  end

  test "should destroy licencium" do
    assert_difference('Licencium.count', -1) do
      delete :destroy, id: @licencium
    end

    assert_redirected_to licencia_path
  end
end
