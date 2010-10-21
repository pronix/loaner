Factory.define :user do |u|
  u.email Faker::Internet.email
  u.username "#{Faker::Internet.user_name}"
  u.password 'secret'
  u.password_confirmation 'secret'
end

Factory.define :admin_user, :parent => :user do |u|
  u.email "admin@loaner.com"
  u.username "admin"
  u.password 'secret'
  u.password_confirmation 'secret'
end
