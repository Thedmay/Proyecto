json.array!(@bills) do |bill|
  json.extract! bill, :id, :numero, :fecha, :razon_social, :giro_comercial, :monto_neto, :iva, :total, :Customer_id
  json.url bill_url(bill, format: :json)
end
