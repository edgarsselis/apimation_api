When(/^I create new project$/) do
  create_project
end

Then(/^I add two environments$/) do
  open_project
  create_dev_environment
  create_prod_environment
end

And(/^I add global variables$/) do
  add_dev_env_variables
  add_prod_env_variables
end

And(/^I delete created environments$/) do
  delete_dev_env
  delete_prod_env
end

And(/^I select existing project$/) do
  open_project
end

Then(/^I add new collection$/) do
  create_collection
end

Then(/^I create new request$/) do
  create_request
end
