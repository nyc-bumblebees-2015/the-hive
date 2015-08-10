require 'rails_helper'

describe ProjectsController do

  let(:project) {FactoryGirl.create(:project)}
  let(:user) {FactoryGirl.create(:user)}
  let(:tag) {FactoryGirl.create(:tag)}


  describe 'GET #new' do
    before(:each) do
      set_user_session user
    end
    context 'while logged in' do
      it 'brings up the form for a new project' do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #new' do
    context 'while not logged in' do
      it 'redirects to you root path' do
        get :new
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'POST #create' do
    context 'if not logged in' do
      it 'redirects user to root path' do
        post :create
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'POST #create' do
    before(:each) do
      set_user_session user
    end
    context 'while logged in to site' do
      context 'with valid attributes' do
        it 'save project to database'
        it 'splits the tag field into individual tags, separated by commas'
        it 'capitalizes the tag name'
        it 'adds the tags'
        it 'redirects to the newly created project'
      end
      context 'with invalid attributes' do
        it "doesn't save project to database with no title set"
        it "doesn't save project to database with no description set"
        it "doesn't save project to database with no status set"
        it "doesn't save project to database with no skills set"
        it 'tells the user if the tag does not exist'
        it 're-renders the the new project form'
      end
    end
  end

end