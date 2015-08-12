require 'rails_helper'

describe HubController do

  let(:user) { FactoryGirl.create(:user)}

  describe 'GET #index' do
    context 'if user is not logged in' do
      it 'redirect to root path' do
        get :index
        expect(response.status).to eq(200)
      end
    end
    context 'if user is logged in' do
      before(:each) do
        set_user_session user
      end
      it 'renders the splash page' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end
end