require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = create(:user)
  end

  it 'is valid with header, content, user_id' do
    @post = build(:post, user_id: @user.id)
    expect(@post).to be_valid
  end

  it 'is invalid without header' do
    @post = build(:post, header: nil, user_id: @user.id)
    @post.valid?
    expect(@post.errors[:base]).to include('Отсутствует заголовок')
  end

  it 'is invalid without content' do
    @post = build(:post, content: nil, user_id: @user.id)
    @post.valid?
    expect(@post.errors[:base]).to include('Отсутствует содержание поста')
  end

  it 'is invalid without user_id' do
    @post = build(:post, user_id: nil)
    @post.valid?
    expect(@post.errors[:base]).to include('Отсутствует автор')
  end
end
