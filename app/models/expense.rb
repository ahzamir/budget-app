class Expense < ApplicationRecord
    belongs_to :user, class_name: "User"
    has_many :joins, dependent: :destroy, foreign_key: "expense_id", class_name: "Join"
    has_many :categories, through: :joins, source: :category

    validates :name, :amount, presence: true, length: { maximum: 50 }
    validates :amount, numericality: { greater_than: 0 }
end
