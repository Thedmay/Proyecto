require 'test_helper'

class BillProductsControllerTest < ActionController::TestCase
  setup do
    @bill_product = bill_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bill_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill_product" do
    assert_difference('BillProduct.count') do
      post :create, bill_product: { Bill_id: @bill_product.Bill_id, Product_id: @bill_product.Product_id }
    end

    assert_redirected_to bill_product_path(assigns(:bill_product))
  end

  test "should show bill_product" do
    get :show, id: @bill_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill_product
    assert_response :success
  end

  test "should update bill_product" do
    patch :update, id: @bill_product, bill_product: { Bill_id: @bill_product.Bill_id, Product_id: @bill_product.Product_id }
    assert_redirected_to bill_product_path(assigns(:bill_product))
  end

  test "should destroy bill_product" do
    assert_difference('BillProduct.count', -1) do
      delete :destroy, id: @bill_product
    end

    assert_redirected_to bill_products_path
  end
end
