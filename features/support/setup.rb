require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

Before do
  if AdminUser.count == 0
    AdminUser.create!(:email => 'admin@example.com',
                      :password => 'password',
                      :password_confirmation => 'password')  
    
  end
end


Before do
  visit new_admin_user_session_path
  fill_in "Email", with: "admin@example.com"
  fill_in "Password", with: "password"
  click_button "Login"  
end

Before('@javascript') do
  DatabaseCleaner.strategy = :truncation, {except: %w[admin_users]}
end
