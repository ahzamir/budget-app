class User < ApplicationRecord
    has_many :categories, dependent: :destroy
    has_many :expenses, dependent: :destroy

    validates :name, :email, presence: true, length: { maximum: 50 }
    validates :email, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
end
