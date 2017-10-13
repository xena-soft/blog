module Validators
  class RatingValidator < ActiveModel::Validator
    def validate(record)
      record.errors[:base] << 'Должно быть число 1-5' unless Post::RATINGS.include?(record)
    end
  end
end
