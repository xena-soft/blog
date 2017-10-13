class Rating < ApplicationRecord
  belongs_to :post
  validates_with Validators::RatingValidator

end
