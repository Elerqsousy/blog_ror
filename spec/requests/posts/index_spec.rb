require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/#/posts' do
    it 'returns a 200 OK status' do
      get '/users/18/posts'
      expect(response).to have_http_status(200)
    end

    it 'renders the index.html.erb template' do
      get '/users/18/posts'
      expect(response).to render_template(:index)
    end

    it 'renders the index page with html elements' do
      get '/users/18/posts'
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
end
