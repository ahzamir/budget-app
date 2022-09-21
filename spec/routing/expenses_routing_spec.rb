require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/1/categories/1/expenses').to route_to('expenses#index', user_id: '1', category_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/users/1/categories/1/expenses/new').to route_to('expenses#new', user_id: '1', category_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/users/1/categories/1/expenses/1').to route_to('expenses#show', user_id: '1', category_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/1/categories/1/expenses/1/edit').to route_to('expenses#edit', user_id: '1', category_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/1/categories/1/expenses').to route_to('expenses#create', user_id: '1', category_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1/categories/1/expenses/1').to route_to('expenses#update', user_id: '1', category_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1/categories/1/expenses/1').to route_to('expenses#update', user_id: '1', category_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1/categories/1/expenses/1').to route_to('expenses#destroy', user_id: '1', category_id: '1', id: '1')
    end
  end
end