require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users#show' do
    it 'returns OK a status code of 200' do
      get '/users/732'
      expect(response).to have_http_status(200)
    end

    it 'renders expected html elements' do
      get '/users/732'
      expect(response.body).to include('here is a single user display')
    end

    it 'contains the user ID in the URL' do
      get '/users/732'
      expect(request.fullpath).to include('/users/732')
    end

    it 'renders the show.html.erb template' do
      get '/users/732'
      expect(response).to render_template(:show)
    end
  end
end
