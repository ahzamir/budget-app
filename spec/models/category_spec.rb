require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create!(name: 'Ahmad Zamir Yousufi', email: 'example@gmail.com', password: '123456')
  end

  it 'is valid with valid attributes' do
    category = Category.new(name: 'Test Category', icon: 'test-icon', user_id: @user.id)
    expect(category).to be_valid
  end
end
