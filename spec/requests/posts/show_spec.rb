require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/#/posts/#' do
    it 'returns OK a status code of 200' do
      get '/users/18/posts/1'
      expect(response).to have_http_status(200)
    end

    it 'renders expected html elements' do
      get '/users/18/posts/1'
      expect(response.body).to include('Here is a single post for a given user')
    end

    it 'contains the user ID in the URL' do
      get '/users/18/posts/1'
      expect(request.fullpath).to include('/users/18/posts/1')
    end

    it 'renders the show.html.erb template' do
      get '/users/18/posts/1'
      expect(response).to render_template(:show)
    end
  end
end
