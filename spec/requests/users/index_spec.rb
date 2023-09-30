require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a 200 OK status' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the index.html.erb template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'renders the index page with html elements' do
      get '/users'
      expect(response.body).to include('Here is a list of users')
    end
  end
end
