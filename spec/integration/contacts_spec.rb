require 'rails_helper'

# RSpec.describe "Contacts", type: :request do
#   describe "GET /contacts" do
#     it "works! (now write some real specs)" do
#       get contacts_index_path
#       expect(response).to have_http_status(200)
#     end
#   end

feature 'User on contacts index page' do
  scenario "opens contacts page" do
    sign_in
    # session = Capybara::Session.new :selenium # instantiate new session object
    # session.visit(visit user_contacts_path(@user)
    visit user_contacts_path(@user)
  end

  def sign_in
    @user = create(:user)
    visit "/"
    click_link "Sign In"
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Sign In"
  end
end

#current_user problem
#https://stackoverflow.com/questions/38906811/rspec-rails-4-access-current-user-from-rspec-feature-spec
#https://stackoverflow.com/questions/10039253/why-i-can-not-get-current-user-while-writing-test-case-with-rspec-and-capybara