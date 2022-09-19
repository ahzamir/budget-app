class Expense < ApplicationRecord
    belongs_to :user, class_name: "User"
    has_many :joins, dependent: :destroy, foreign_key: "expense_id", class_name: "Join"
    has_many :categories, through: :joins, source: :category
end
