class Wine < ApplicationRecord
  belongs_to :region
  belongs_to :varietal
  has_many :reviews 
  has_many :users, through: :reviews 

  accepts_nested_attributes_for :reviews 

  validates :name, :year, :color, presence: true
  
  validates_uniqueness_of :name, scope: [:year, :varietal, :color], case_sensitive: false 

  scope :order_by_stars, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

 

  def self.latest_three
    last(3)
  end 

  def average_rating
    reviews.average(:stars)
  end 

  def average_price
    reviews.average(:price)
  end 

  def pretty_price 
    average_price.round(2) 
  end 

  def wine_var
    name + " " + varietal.name
  end 



end
