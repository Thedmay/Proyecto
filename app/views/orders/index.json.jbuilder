json.array!(@orders) do |order|
  json.extract! order, :id, :numero, :fecha, :detalle, :cantidad, :medida, :Customer_id
  json.url order_url(order, format: :json)
end
