require 'test_helper'

class MatterProductsControllerTest < ActionController::TestCase
  setup do
    @matter_product = matter_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matter_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matter_product" do
    assert_difference('MatterProduct.count') do
      post :create, matter_product: { Matter_id: @matter_product.Matter_id, Product_id: @matter_product.Product_id, cantidad: @matter_product.cantidad, fecha: @matter_product.fecha, materia: @matter_product.materia, medida: @matter_product.medida, nombre: @matter_product.nombre }
    end

    assert_redirected_to matter_product_path(assigns(:matter_product))
  end

  test "should show matter_product" do
    get :show, id: @matter_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matter_product
    assert_response :success
  end

  test "should update matter_product" do
    patch :update, id: @matter_product, matter_product: { Matter_id: @matter_product.Matter_id, Product_id: @matter_product.Product_id, cantidad: @matter_product.cantidad, fecha: @matter_product.fecha, materia: @matter_product.materia, medida: @matter_product.medida, nombre: @matter_product.nombre }
    assert_redirected_to matter_product_path(assigns(:matter_product))
  end

  test "should destroy matter_product" do
    assert_difference('MatterProduct.count', -1) do
      delete :destroy, id: @matter_product
    end

    assert_redirected_to matter_products_path
  end
end
