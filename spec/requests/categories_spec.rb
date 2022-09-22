require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET #index' do
    include Devise::Test::IntegrationHelpers
    before do
      @user = User.create(name: 'test', email: 'test@gmail.com', password: '123456')
      sign_in @user
    end

    it 'returns a success response' do
      get(user_categories_path(@user))
      expect(response).to be_successful
    end

    it 'returns a 200 response' do
      get(user_categories_path(@user))
      expect(response).to have_http_status '200'
    end
  end
end
