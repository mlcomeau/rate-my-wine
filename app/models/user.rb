class User < ApplicationRecord
    has_many :reviews 
    has_many :wines, through: :reviews 

    has_secure_password

    validates :username, uniqueness: true 
    validates :username, presence: true 
    validates :password, presence: true 
end
