require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create!(name: 'Ahmad Zamir Yousufi', email: 'example@gmail.com', password: '123456')
    @category = Category.create!(name: 'Test Category', icon: 'test-icon', user_id: @user.id)
  end

  it 'is valid with valid attributes' do
    expense = Expense.new(name: 'Test Expense', amount: 100, user_id: @user.id)
    expect(expense).to be_valid
  end

  it 'is not valid without a name' do
    expense = Expense.new(name: nil, amount: 100, user_id: @user.id)
    expect(expense).to_not be_valid
  end

  it 'is not valid without an amount' do
    expense = Expense.new(name: 'Test Expense', amount: nil, user_id: @user.id)
    expect(expense).to_not be_valid
  end

  it 'is not valid with a negative amount' do
    expense = Expense.new(name: 'Test Expense', amount: -100, user_id: @user.id)
    expect(expense).to_not be_valid
  end

  it 'is not valid with a zero amount' do
    expense = Expense.new(name: 'Test Expense', amount: 0, user_id: @user.id)
    expect(expense).to_not be_valid
  end

  it 'is not valid with a non-numeric amount' do
    expense = Expense.new(name: 'Test Expense', amount: 'abc', user_id: @user.id)
    expect(expense).to_not be_valid
  end
end
