json.array!(@lincenses) do |lincense|
  json.extract! lincense, :id, :employee_id, :fechaInicio, :duracion, :detalle
  json.url lincense_url(lincense, format: :json)
end
