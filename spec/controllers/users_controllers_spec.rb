require 'rails_helper'

describe UsersController do
  before :each do

  end

  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      user = create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq user
    end
    it 'renders the :show template' do
      user = create(:user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new User to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    xit 'assigns the requested user to @user' do
      user = create(:user)
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end
    xit 'renders the :edit template' do
      user = create(:user)
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new user in the database'
      it 'redirects to root path'
    end
    context 'with invalid attributes' do
      it 'does not save the new user in the database'
      it 're-renders the :new template'
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the user in the database'
      it 'redirects to user :show page'
    end
    context 'with invalid attributes' do
      it 'does not update the user contact'
      it 're-renders the :edit template'
    end
  end

end