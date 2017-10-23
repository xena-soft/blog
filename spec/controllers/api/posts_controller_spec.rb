require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do

  describe 'get#index' do
    before do
      @user = create(:user)
      @post1 = create(:post, user_id: @user.id, average_rating: 1)
      @post2 = create(:post, user_id: @user.id, average_rating: 2)
      @post3 = create(:post, user_id: @user.id, average_rating: 3)
    end

    it 'returns http success' do
      get :index
      expect(response).to be_success
    end

    it 'top posts with params[:top]' do
      get :index, params: {top: 2}
      expect(assigns(:posts)).to match_array([@post2, @post3])
    end

    it 'all posts without params[:top]' do
      get :index
      expect(assigns(:posts)).to match_array([@post1, @post2, @post3])
    end
  end

  describe 'post#create' do
    context 'user with login' do
      before do
        @user = create(:user)
      end

      it 'save new post in database' do
        expect{ post :create, params: { post: attributes_for(:post, user_id: @user.id) } }.to change(Post, :count).by(1)
      end

      it 'not save post in database' do
        expect{ post :create, params: { post: attributes_for(:invalid_post) } }.not_to change(Post, :count)
      end
    end

    context 'user without login' do
      it 'valid post' do
        @user = create(:no_login_user)
        expect{ post :create, params: { post: attributes_for(:post, user_id: @user.id) } }.to change(Post, :count).by(1)
      end

      it 'invalid post' do
        # errors = ['Отсутствует автор', 'Отсутствует заголовок', 'Отсутствует содержание поста']
        # expect(@post.errors[:base]).to include(errors)
      end
    end
  end

  describe 'patch#update' do
    it 'change average_rating attribute' do
      @user = create(:user)
      @post = create(:post, user_id: @user.id)
      @rating = create(:rating, post_id: @post.id)
      patch :update, params: { id: @post, post: attributes_for(:post, average_rating: '2'), rating: attributes_for(:rating) }
      @post.reload
      expect(@post.average_rating).to eq('2')
    end
  end

  describe 'get#get_authors' do
    before do
      @user = create(:user)
      @post1 = create(:post, user_id: @user.id, author_ip: 1)
      @post2 = create(:post, user_id: @user.id, author_ip: 2)
      @post3 = create(:post, user_id: @user.id, author_ip: 3)
    end

    it 'returns http success' do
      get :get_authors
      expect(response).to be_success
    end

    it 'all posts with authors login and ip' do
      expect(assigns(:posts)).to match_array([@post1, @post2, @post3])
    end
  end

end
