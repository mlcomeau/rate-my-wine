class Wine < ApplicationRecord
  belongs_to :region
  belongs_to :varietal
end
