Dry::Rails.container do
  auto_register!("app/operations")
  auto_register!("app/repositories")
  auto_register!("app/containers")
end
