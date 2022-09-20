class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :joins, dependent: :destroy, foreign_key: 'category_id', class_name: 'Join'
  has_many :expenses, through: :joins, source: :expense, class_name: 'Expense'

  validates :name, :icon, presence: true, length: { maximum: 50 }

  def total_expenses
    expenses.where(user_id: user.id).sum(:amount)
  end
end
