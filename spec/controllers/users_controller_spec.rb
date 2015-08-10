require 'rails_helper'

describe UsersController do

  let(:user) { FactoryGirl.create(:user)}

  # let(:user) do
  #   create(:user, first_name: "Bobby", last_name: "Fisher")
  # end

  let(:valid_attributes) {attributes_for(:user)}
  let(:invalid_attributes) {attributes_for(:invalid_user)}

  before(:each) do
    set_user_session user
  end

  describe 'GET #show' do
    it 'assigns the requested user to user' do
      get :show, id: user
      expect(assigns(:user)).to eq user
    end
    it 'renders the :show template' do
      user = create(:user, username:'goozer3', email:'goozer3@gmail.com')
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user to user' do
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end
    it 'renders the :edit template' do
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    before :each do
      @user = attributes_for(:user)
    end
    context 'with valid attributes' do
      it 'saves the new user in the database' do
        expect{
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end
      it 'redirects to root path' do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to root_path
      end
    end
    context 'with invalid attributes' do
      it 'does not save the new user in the database' do
        expect{
          post :create, user: attributes_for(:invalid_user)
        }.not_to change(User, :count)
      end
    end
  end

  describe 'PATCH #update' do

    context 'with valid attributes' do
      it 'locates the requested user' do
        patch :update, id: user, user: attributes_for(:user)
        expect(assigns(:user)).to eq @user
      end
      it 'updates the user in the database' do
        patch :update, id: user, user: attributes_for(:user, first_name: 'Larry', last_name: 'Smith')
        user.reload
        expect(user.first_name).to eq 'Larry'
        expect(user.last_name).to eq 'Smith'
      end

      it 'redirects to user :show page' do
        patch :update, id: user, user: attributes_for(:user)
        expect(response).to redirect_to user
      end
    end
    context 'with invalid attributes' do

      it 'does not update the user contact' do
        patch :update, id: user, user: attributes_for(:user, first_name: "Jay", last_name: nil)
        user.reload
        expect(user.first_name).to eq('Jason')
        expect(user.last_name).not_to eq('Smith')
      end
      it 're-renders the :edit template' do
        patch :update, id: user, user: invalid_attributes
        expect(response).to redirect_to edit_user_path(user)
      end
    end
  end

end