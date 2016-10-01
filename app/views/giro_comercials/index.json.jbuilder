json.array!(@giro_comercials) do |giro_comercial|
  json.extract! giro_comercial, :id, :nombre
  json.url giro_comercial_url(giro_comercial, format: :json)
end
