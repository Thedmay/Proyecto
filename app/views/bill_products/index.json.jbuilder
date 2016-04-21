json.array!(@bill_products) do |bill_product|
  json.extract! bill_product, :id, :Bill_id, :Product_id
  json.url bill_product_url(bill_product, format: :json)
end
