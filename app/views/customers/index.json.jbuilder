json.array!(@customers) do |customer|
  json.extract! customer, :id, :nombre, :rut, :telefono, :email, :direccion
  json.url customer_url(customer, format: :json)
end
