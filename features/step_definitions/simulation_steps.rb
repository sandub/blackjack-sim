Given(/^anyone visits the simulation page$/) do
  visit simulate_path
end

When(/^he starts the simulation$/) do
  click_button "Start"
end

Then(/^he should see the results page$/) do
  assert page.has_content?("Results")
end
