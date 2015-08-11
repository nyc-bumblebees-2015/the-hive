require 'rails_helper'

describe 'The log-in and log-out process' do
  before :each do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'BananaPeeler'
    fill_in 'First name', with: 'Banana'
    fill_in 'Last name', with 'Peeler'
    fill_in 'Email', with: 'bananapeeler@gmail.com'
    fill_in 'Password', with: 'banana'
    fill_in 'Password confirmation', with: 'banana'
    fill_in 'Zip code', with: '10004'
    click_button 'Sign up'
  end

  feature 'sign up' do
    scenario 'should sign up the user' do
      visit root_path
      expect(page).to have_content('Log In')
    end
  end

  feature 'log out' do
    scenario 'should log the user out' do
      visit root_path
      click_link 'logout'
      expect(page).to have_content('Log In')
    end
  end

  feature 'log in' do
    scenario 'should log the user in' do
      visit root_path
      click_link 'login'
      find('#username').set('BananaPeeler')
      find('#password').set('banana')
      click_link 'login'
      expect(page).to have_content('Log Out')
    end
  end

end