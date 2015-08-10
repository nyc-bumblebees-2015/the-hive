require 'rails_helper'

describe SessionsController do

  let(:user) { FactoryGirl.create(:user)}

  describe 'POST #create' do
    it 'logs in a user with correct credentials' do
      post :create, user:{username: user.username, password: user.password}
      expect(session[:user_id]).to eq(user.id)
    end

    it 'does not log in a user with incorrect credentials' do
      post :create, user:{username: user.username, password:'1234567'}
      expect(session[:user_id]).to be_nil
    end

  end

end