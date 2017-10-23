FactoryGirl.define do

  factory :user do
    login 'max'
  end

  factory :no_login_user, class: 'User' do
    login 'noname'
  end
end
