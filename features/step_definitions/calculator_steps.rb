Given /^Application has basic configuration$/ do
  And %{Application have test users} 
  And %{Application have test persons} 
end

And /Application ha(?:s|ve) test users/ do
  Factory.create :user
  Factory.create :admin_user
end

Given /^Application have test persons$/ do
  5.times { Factory.create :person }
end
