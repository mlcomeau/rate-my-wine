class Wine < ApplicationRecord
  belongs_to :region
  belongs_to :varietal
  has_many :reviews 
  has_many :users, through: :reviews 

  accepts_nested_attributes_for :reviews 

  validates :name, :year, :color, presence: true
  
  validates_uniqueness_of :name, scope: [:year, :varietal, :color], case_sensitive: false 

  def reviews_attributes=(reviews_attributes)
    reviews_attributes.each do |review_attribute|
      self.reviews.build(review_attribute)
    end 
  end 

end
