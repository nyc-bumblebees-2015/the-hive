require 'rails_helper'

describe HubController do

  let(:user) { FactoryGirl.create(:user)}

  describe 'GET #index' do
    context 'if user is not logged in' do
      it 'redirect to root path' do
        get :index
        expect(response).to render_template :splash
      end
    end
    context 'if user is logged in' do
      before(:each) do
        set_user_session user
      end
      xit 'sets a user with user session' do
        get :index
        expect(user).to eq(current_user)
      end
    end
  end
end