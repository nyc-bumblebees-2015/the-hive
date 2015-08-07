require 'rails_helper'

describe User do
  it 'is invalid without a first name'
  it 'is invalid without a last name'
  it 'is invalid without a username'
  it 'is invalid with a duplicate username'
  it 'is invalid without an email address'
  it 'is invalid with a duplicate email'
  it 'is invalid without a zip code'
  it 'is invalid with a zip code with a length other than 5'
  it 'is invalid with a zip code that contains anything other than numbers'
  it 'is invalid without a password'
  it 'is invalid when a password length is less that 6'
  it 'is invalid when a password length is greater than 20'

end