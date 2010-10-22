Factory.define :person do |p|
  p.name Faker::Name.name
  p.annual_income rand(1000000)
  p.birth_at((rand(20000)).days.ago)
end
