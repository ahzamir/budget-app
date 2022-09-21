require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before(:each) do
    @user = User.create!(name: 'Ahmad Zamir Yousufi', email: 'example@gmail.com', password: '123456')
    @category = Category.create!(name: 'Test Category', icon: 'test-icon', user_id: @user.id)
  end

  describe 'GET /categories' do
    it 'returns http success' do
      get user_categories_path(@user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get user_categories_path(@user)
      expect(response).to render_template('index')
    end

    it 'loads all of the categories' do
      get user_categories_path(@user)
      expect(assigns(:categories)).to eq([@category])
    end
  end
end
