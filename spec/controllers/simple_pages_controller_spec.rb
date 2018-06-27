require 'rails_helper'

describe SimplePagesController, type: :controller do

  context 'GET #index' do
    it 'renders index template' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end
end
