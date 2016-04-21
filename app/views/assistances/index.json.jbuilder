json.array!(@assistances) do |assistance|
  json.extract! assistance, :id, :asiste, :licencia, :fecha, :Employee_id
  json.url assistance_url(assistance, format: :json)
end
