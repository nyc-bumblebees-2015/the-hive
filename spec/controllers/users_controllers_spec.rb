require 'rails_helper'

describe UsersController do
  before(:each) do
    set_user_session create(:user)
  end

  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      user = create(:user, username:'goozer2', email:'goozer2@gmail.com')
      get :show, id: user
      expect(assigns(:user)).to eq user
    end
    it 'renders the :show template' do
      user = create(:user, username:'goozer3', email:'goozer3@gmail.com')
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
    it 'assigns the requested user to @user' do
      user = create(:user)
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end
    it 'renders the :edit template' do
      user = create(:user)
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
      it 're-renders the :new template' do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @user = create(:user, first_name: 'Jay', last_name: 'Smith')
    end

    context 'with valid attributes' do
      it 'locates the requested @user' do
        patch :update, id: @user, user: attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end
      it 'updates the user in the database' do
        patch :update, id: @user, user: attributes_for(:user, first_name: 'Tom', last_name: 'Smith')
        @user.reload
        expect(@user.first_name).to eq('Tom')
        expect(@user.last_name).to eq('Smith')
      end


      it 'redirects to user :show page'
    end
    context 'with invalid attributes' do
      it 'does not update the user contact'
      it 're-renders the :edit template'
    end
  end

end