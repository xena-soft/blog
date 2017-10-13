class AverageRatingCalc
  def initialize(post)
    @post = post
  end

  def calc
    sum = 0
    @post.ratings.each do |rating|
      sum = sum + rating.rating
    end
    sum / @post.ratings.count
  end
end
