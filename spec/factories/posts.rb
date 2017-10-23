FactoryGirl.define do

  factory :post do
    header         'ааа'
    content        'bbb'
    user_id        1
    author_ip      1
    average_rating nil
  end

  factory :invalid_post, class: 'Post' do
    header         ''
    content        ''
    user_id        nil
    author_ip      1
    average_rating nil
  end

end
