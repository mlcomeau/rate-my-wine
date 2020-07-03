class Wine < ApplicationRecord
  belongs_to :region
  belongs_to :varietal
  has_many :reviews 
  has_many :users, through: :reviews 

  validates :name, :year, :color, presence: true
  
  validates_uniqueness_of :name, scope: [:year, :varietal, :color], case_sensitive: false 

  scope :order_by_stars, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

  def self.latest_three
    last(3)
  end 

end
