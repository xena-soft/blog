class Post < ApplicationRecord
  belongs_to :user
  validates_with Validators::PostValidator
  RATINGS = [ 1, 2, 3, 4, 5 ]
end
