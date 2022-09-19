class User < ApplicationRecord
    has_many :categories, dependent: :destroy
    has_many :expenses, dependent: :destroy

    validates :name, :photo, presence: true, length: { maximum: 50 }
end
