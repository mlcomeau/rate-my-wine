class Review < ApplicationRecord
  belongs_to :wine
  belongs_to :user

  validates :content, :price, presence: true 
  validates :stars, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
  validates :price, numericality: true 

  validates :wine, uniqueness: { scope: :user, message: "- You already reviewed this wine!" }

  def self.most_recent
    order(created_at: :desc)
  end  

end
