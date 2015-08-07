require 'rails_helper'

describe User do
  it 'is invalid without a first name' do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it 'is invalid without a last name' do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it 'is invalid without a username' do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'is invalid with a duplicate username' do
    User.create(first_name: 'Joe', last_name: 'Tester', email: 'tester@example.com', username: 'joebags', password: 'banana', zip_code: '10004', longitude: 40.74, latitude: 47.23)
    user = User.new(first_name: 'Joe', last_name: 'Tester', email: 'tester2@example.com', username: 'joebags', password: 'banana', zip_code: '10004', longitude: 40.74, latitude: 47.23)
    user.valid?
    expect(user.errors[:username]).to include("has already been taken")
  end

  it 'is invalid without an email address' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email' do
    User.create(first_name: 'Joe', last_name: 'Tester', email: 'tester@example.com', username: 'joebags', password: 'banana', zip_code: '10004', longitude: 40.74, latitude: 47.23)
    user = User.new(first_name: 'Joe', last_name: 'Tester', email: 'tester@example.com', username: 'joebags', password: 'banana', zip_code: '10004', longitude: 40.74, latitude: 47.23)
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it 'is invalid without a zip code' do
    user = User.new(zip_code: nil)
    user.valid?
    expect(user.errors[:zip_code]).to include("is the wrong length (should be 5 characters)")
  end

  it 'is invalid with a zip code with a length other than 5' do
    user = User.new(zip_code: 123456)
    user.valid?
    expect(user.errors[:zip_code]).to include("is the wrong length (should be 5 characters)")
  end

  it 'is invalid without a password' do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is invalid when a password length is less that 6' do
    user = User.new(password: 'bana')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it 'is invalid when a password length is greater than 20' do
    user = User.new(password: 'banananananananananan')
    user.valid?
    expect(user.errors[:password]).to include("is too long (maximum is 20 characters)")
  end

end

      # t.string :username, null: false, unique: true, index: true
      # t.string :first_name, null: false
      # t.string :last_name, null: false
      # t.string :email, null: false, unique: true
      # t.string :password_digest, null: false
      # t.text :bio, default: nil
      # t.string :zip_code, null: false
      # t.float :longitude, null: false
      # t.float :latitude, null: false
      # t.string :github_link, default: nil
      # t.string :website_link, default: nil
