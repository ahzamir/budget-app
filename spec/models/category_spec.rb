require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create!(name: 'Ahmad Zamir Yousufi', email: 'example@gmail.com', password: '123456')
  end

  it 'is valid with valid attributes' do
    category = Category.new(name: 'Test Category', icon: 'test-icon', user_id: @user.id)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(name: nil, icon: 'test-icon', user_id: @user.id)
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category = Category.new(name: 'Test Category', icon: nil, user_id: @user.id)
    expect(category).to_not be_valid
  end
end
