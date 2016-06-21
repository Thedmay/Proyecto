json.array!(@assistances) do |assistance|
  json.extract! assistance, :id, :fecha_id, :employee_id, :asiste
  json.url assistance_url(assistance, format: :json)
end
