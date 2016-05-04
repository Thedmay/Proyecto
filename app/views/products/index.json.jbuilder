json.array!(@products) do |product|
  json.extract! product, :id, :nombre, :codigo, :unidades, :cantidad, :medida, :fecha_produce, :category_id
  json.url product_url(product, format: :json)
end
