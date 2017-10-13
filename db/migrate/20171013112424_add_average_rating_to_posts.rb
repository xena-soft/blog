class AddAverageRatingToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :average_rating, :integer
  end
end
