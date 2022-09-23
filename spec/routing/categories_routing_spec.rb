require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/1/categories').to route_to('categories#index', user_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/users/1/categories/new').to route_to('categories#new', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/users/1/categories/1').to route_to('categories#show', user_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/1/categories/1/edit').to route_to('categories#edit', user_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/1/categories').to route_to('categories#create', user_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1/categories/1').to route_to('categories#update', user_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1/categories/1').to route_to('categories#update', user_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1/categories/1').to route_to('categories#destroy', user_id: '1', id: '1')
    end
  end
end
