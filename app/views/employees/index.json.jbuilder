json.array!(@employees) do |employee|
  json.extract! employee, :id, :nombre, :rut, :clave, :email, :sueldo, :fecha_ingreso
  json.url employee_url(employee, format: :json)
end
