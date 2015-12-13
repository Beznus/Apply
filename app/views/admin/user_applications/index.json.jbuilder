json.array!(@admin_user_applications) do |admin_user_application|
  json.extract! admin_user_application, :id
  json.url admin_user_application_url(admin_user_application, format: :json)
end
