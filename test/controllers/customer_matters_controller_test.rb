require 'test_helper'

class CustomerMattersControllerTest < ActionController::TestCase
  setup do
    @customer_matter = customer_matters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_matters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_matter" do
    assert_difference('CustomerMatter.count') do
      post :create, customer_matter: { customer_id: @customer_matter.customer_id, matter_id: @customer_matter.matter_id }
    end

    assert_redirected_to customer_matter_path(assigns(:customer_matter))
  end

  test "should show customer_matter" do
    get :show, id: @customer_matter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_matter
    assert_response :success
  end

  test "should update customer_matter" do
    patch :update, id: @customer_matter, customer_matter: { customer_id: @customer_matter.customer_id, matter_id: @customer_matter.matter_id }
    assert_redirected_to customer_matter_path(assigns(:customer_matter))
  end

  test "should destroy customer_matter" do
    assert_difference('CustomerMatter.count', -1) do
      delete :destroy, id: @customer_matter
    end

    assert_redirected_to customer_matters_path
  end
end
