Given(/^anyone visits the simulation page$/) do
  visit simulate_path
end

When(/^he starts the simulation$/) do
  click_button start
end

Then(/^he should see the results page$/) do
  page.should have_selector('title', text: "Results")
end
