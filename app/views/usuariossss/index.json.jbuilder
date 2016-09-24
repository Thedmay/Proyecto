json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nombre, :codigo, :unidades, :cantidad, :medida, :fecha_produce, :category_id
  json.url usuario_url(usuario, format: :json)
end
