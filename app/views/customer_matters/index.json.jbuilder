json.array!(@customer_matters) do |customer_matter|
  json.extract! customer_matter, :id, :customer_id, :matter_id
  json.url customer_matter_url(customer_matter, format: :json)
end
