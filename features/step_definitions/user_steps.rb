Given /^a user "(.*)"$/ do |username|
  @current_user = create_user( :username => username )
end

Given /^a user is logged in as "(.*)"$/ do |username|
  @current_user = create_user( :username => username )
  log_in_as username
end

When /^I log in as "(.*)"$/ do |username|
  log_in_as username
end
