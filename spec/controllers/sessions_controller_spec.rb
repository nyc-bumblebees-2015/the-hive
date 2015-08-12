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

  describe 'DELETE #destroy' do
    it 'clears the the session' do
      delete :destroy, id: user
      expect(session[:user_id]). to be_nil
    end
    it 'redirects to root path' do
      delete :destroy, id: user
      expect(response).to redirect_to root_path
    end
    it 'displays you have successfully logged out' do
      delete :destroy, id: user
      expect(flash[:notice]).to have_content("You have successfully logged out.")
    end
  end

end