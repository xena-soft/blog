module Validators
  class RatingValidator < ActiveModel::Validator
    def validate(record)
      record.errors[:base] << '[rating] должен быть числом 1-5' unless Post::RATINGS.include?(record.rating)
    end
  end
end
