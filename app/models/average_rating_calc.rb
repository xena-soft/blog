class AverageRatingCalc
  def initialize(post)
    @post = post
  end

  def calc
    if @post.ratings.count > 0
      sum = 0
      @post.ratings.each do |rating|
        sum += rating.rating
      end
      sum / @post.ratings.count
    else
      0
    end
  end
end
