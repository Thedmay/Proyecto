json.array!(@matter_products) do |matter_product|
  json.extract! matter_product, :id, :nombre, :fecha, :materia, :cantidad, :medida, :Matter_id, :Product_id
  json.url matter_product_url(matter_product, format: :json)
end
