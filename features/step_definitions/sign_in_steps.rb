module UserHelpers
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
end
World(UserHelpers)


#========================================== Более широкие понятия ======================


Given /^в сервисе нет пользователя "([^\"]*)"$/ do |user|
  user = User.find_by_login("user")
  user.destroy
end

Given /^в сервисе нет пользователя с адресом "([^\"]*)"$/ do |email|
  user.destroy if user = User.find_by_email(email)
end

Given /^I logged in as "(.*)\/(.*)"$/ do |username, password|
  Given %{I go to page "login"}
         And %{fill in "user_session[username]" with "#{username}"}
         And %{fill in "user_session[password]" with "#{password}"}
         And %{press "user_session_submit"}
  $current_user = User.find_by_email(username)
end

Then /^должен отправлен на форму входа в сервис$/ do
  visit path_to("/")
end

Given /^я не авторизован$/ do
  Given %{Я перешел на страницу "logout"}
end

Given /^я уже авторизован на сервисе$/ do
  user = Factory.build(:user, :password => 'secret', :password_confirmation => 'secret')
  User.destroy_all(:email => user.email)
  user.save
  # UserSession.create(user, true)
  И %{Я зашел в сервис как "#{user.email}/secret"}
end


Then /^я должен увидеть форму авторизации$/ do
  page.should have_css("form.reg")
end

