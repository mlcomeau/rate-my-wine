class User < ApplicationRecord
    has_many :reviews 
    has_many :wines, through: :reviews 

    has_secure_password

    validates :username, uniqueness: true 
    validates :username, presence: true 
    validates :password, presence: true 

    def self.find_or_create_by_omniauth(auth_hash)
        where(:username => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end 
    end 
end
