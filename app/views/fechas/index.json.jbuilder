json.array!(@fechas) do |fecha|
  json.extract! fecha, :id, :dia, :mes, :año
  json.url fecha_url(fecha, format: :json)
end
