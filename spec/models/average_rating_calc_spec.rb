require 'rails_helper'

RSpec.describe AverageRatingCalc, type: :model do

  before do
    @user = create(:user)
  end

  it 'calculates average rating with ratings' do
    @post = create(:post, user_id: @user.id) do |post|
      post.ratings.create(attributes_for(:rating))
    end
    average_rating_calc = AverageRatingCalc.new(@post)
    expect(average_rating_calc.calc).to eq 2
  end

  it 'calculates average rating without ratings' do
    @post = build(:post)
    average_rating_calc = AverageRatingCalc.new(@post)
    expect(average_rating_calc.calc).to eq 0
  end
end
