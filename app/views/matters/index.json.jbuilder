json.array!(@matters) do |matter|
  json.extract! matter, :id, :nombre, :cantidad, :medida, :saldo, :fecha_ingreso, :fecha_utiliza
  json.url matter_url(matter, format: :json)
end
