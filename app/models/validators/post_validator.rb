module Validators
  class PostValidator < ActiveModel::Validator
    def validate(record)
       record.errors[:base] << 'Отсутствует заголовок' if record.header == nil
       record.errors[:base] << 'Отсутствует содержание поста' if record.content == nil
    end
  end
end
