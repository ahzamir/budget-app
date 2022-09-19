class Join < ApplicationRecord
  belongs_to :categories, class_name: 'Category'
  belongs_to :expenses, class_name: 'Expense'
end
