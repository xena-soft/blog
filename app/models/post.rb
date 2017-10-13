class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates_with Validators::PostValidator

  def ratings_posts
    Post.select(:header, :rating).joins(:ratings).where(header: 'заголовок 1')
  end

  RATINGS = [ 1, 2, 3, 4, 5 ]
end
