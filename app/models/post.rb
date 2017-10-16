class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings

  validates_with Validators::PostValidator

  RATINGS = [ 1, 2, 3, 4, 5 ]
end
