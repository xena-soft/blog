require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { User.create(id: '1', login: 'max') }
  let!(:post) { Post.new(id: '1', header: 'заголовок', content: 'содержимое', user_id: 1) }

  it 'is valid with header, content, user_id' do
    expect(post).to be_valid
  end

  it 'is invalid without header' do
    post.header = nil
    expect(post).to_not be_valid
  end

  it 'is invalid without content' do
    post.content = nil
    expect(post).to_not be_valid
  end

  it 'is invalid without user_id' do
    post.user_id = nil
    expect(post).to_not be_valid
  end
end
