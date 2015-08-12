require 'rails_helper'

describe ProjectsController do

  let(:project) {FactoryGirl.create(:project)}
  let(:user) {FactoryGirl.create(:user)}
  let(:tag) do
    create(:tag, name:'ruby')
  end
  let(:project_attributes) {attributes_for(:project)}

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
    context 'while logged in to site' do
      before(:each) do
        set_user_session user
      end
      context 'with valid attributes' do
        it 'save project to database' do
          expect{
            post :create, project: attributes_for(:project), tags: 'ruby,javascript'
            project.save
          }.to change(Project, :count).by(1)
        end
        it 'adds the valid tags to project' do
          post :create, project: attributes_for(:project), tags: 'ruby'
          expect{response}.to_not raise_error
        end
        it 'redirects to the newly created project' do
          post :create, project: attributes_for(:project), tags: 'ruby'
          expect(response.status).to eq(200)
        end
      end
      context 'with invalid attributes' do
        it "doesn't save project to database with no title set" do
          expect{
          post :create, project: attributes_for(:project, title: nil), tags: 'ruby, javascript'
          }.to change(Project, :count).by(0)
        end
        it "doesn't save project to database with no description set" do
          expect{
          post :create, project: attributes_for(:project, description: nil), tags: 'ruby, javascript'
          }.to change(Project, :count).by(0)
        end
        it "doesn't save project to database with no status set" do
          expect{
          post :create, project: attributes_for(:project, status: nil), tags: 'ruby, javascript'
          }.to change(Project, :count).by(0)
        end
        it "doesn't save project to database with no skills set" do
          expect{
          post :create, project: attributes_for(:project, skills: nil), tags: 'ruby, javascript'
          }.to change(Project, :count).by(0)
        end
        it 're-renders the the new project form' do
          post :create, project: attributes_for(:project, title: nil), tags: 'ruby'
          expect(response).to render_template :new
        end
      end
    end
  end
  describe 'GET #show' do
    context 'when not logged in' do
      xit 'should redirect you to root path' do
        get :show, id: project
        expect(response).to redirect_to root_path
      end
    end
    context 'when logged in' do
      before(:each) do
        set_user_session user
      end
      it 'should view your project' do
        get :show, id: project
        expect(response.status).to eq(200)
      end
      it 'should tell user the project does not exist' do
        get :show, id: 0
        expect(flash[:notice]).to be_present
      end
      it 'should redirect to root path if there is no project' do
        get :show, id: 0
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #edit' do
    context 'when not logged in' do
      xit 'redirects user back to root path' do
        get :edit, id: project
        expect(response).to redirect_to root_path
      end
    end
    context 'when logged in' do
      xit 'should bring up form to edit project' do
        get :edit, id: project
        expect(response).to render_template :edit
      end
    end
  end

  describe 'PATCH #update' do
    context 'while not logged in' do
      xit 'redirects user back to the root path' do
        get :patch, id: project
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'while not logged in' do
      xit 'redirects user back to the root path' do
        get :delete, id: project
        expect(response).to redirect_to root_path
      end
    end
    context 'while logged in' do
      before(:each) do
        set_user_session user
      end
      it 'deletes the project'
      it 'redirects to root path'
    end

  end

  describe 'GET #results' do
    context 'while not logged in' do
      xit 'redirects user back to the root path' do
        get :results, id: project
        expect(true).to eq(true)
      end
    end
    context 'while logged in' do
      before(:each) do
        set_user_session user
      end
      it 'allows the user to search'
      it 'it finds the projects closest to the user search results'
      it 'creates a collection of projects'
      it 'makes an ajax request'
    end
  end

end