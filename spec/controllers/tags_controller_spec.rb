require 'rails_helper'

describe TagsController do
  describe 'GET #index' do
    it 'it lists all the tags' do
      get :index
      expect(response).to render_template :index
    end

  end
  describe 'GET #show' do
    it 'it shows the index page for the selected tag' do
      tag = create(:tag)
      get :show, id: tag
      expect(response).to render_template :show
    end
  end

end