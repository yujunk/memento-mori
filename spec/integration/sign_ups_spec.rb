require 'rails_helper'

feature 'Visitor signs up' do
  
  scenario "opens sign up page" do
     visit sign_up_path
  end

  scenario "with valid form information" do
    sign_up_with "hello@gmail.com", "doe", "john", "basic2018"

    expect(current_path).to eq '/'
  end

  scenario "with invalid form information will remain on page" do
    sign_up_with "hello", "doe", "john", "basic2018"

    # expect(page).to have_content('Please include an \'a\' in the email address.')
    expect(current_path).to eq '/sign_up'
  end


  def sign_up_with(email, last_name, first_name, password) 
    visit(sign_up_path)
    fill_in 'Email', with: email
    fill_in 'Last name', with: last_name
    fill_in 'First name', with: first_name
    fill_in 'Password', with: password
    click_button 'Sign Up'
  end
  
end


#Guides
#https://robots.thoughtbot.com/rspec-integration-tests-with-capybara
#https://www.sitepoint.com/basics-capybara-improving-tests/

#Library
#http://www.rubydoc.info/github/teamcapybara/capybara