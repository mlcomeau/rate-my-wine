class Wine < ApplicationRecord
  belongs_to :region
  belongs_to :varietal
  has_many :reviews 
  has_many :users, through: :reviews 
end
