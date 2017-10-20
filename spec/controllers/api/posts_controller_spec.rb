require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do

  describe 'get#index' do
    before do
      @post1 = create(:post, average_rating: 1)
      @post2 = create(:post, average_rating: 2)
      @post3 = create(:post, average_rating: 3)
    end

    # it 'top posts with params[:top]' do
    #   get :index, top: '2'
    #   expect(assigns(:posts)).to match_array([@post2, @post3])
    # end

    it 'all posts without params[:top]' do
      get :index
      expect(assigns(:posts)).to match_array([@post1, @post2, @post3])
    end
  end

  describe 'post#create' do

  end

  describe 'patch#update' do

  end

  # describe 'post#create' do
  #
  #   it 'create purchase order with cost_estimate' do
  #
  #     sign_in :user
  #     cost_estimate = create(:cost_estimate)
  #     purchase_order = create(:purchase_order_ce, cost_estimate: cost_estimate)
  #     expect{ post :create, purchase_order: attributes_for(:purchase_order) }.to change(PurchaseOrder, :count).by(1)
  #   end
  #
  #   it 'create purchase order without cost_estimate' do
  #     sign_in :user
  #     purchase_order = create(:purchase_order)
  #     expect{ post :create, purchase_order: attributes_for(:purchase_order) }.to change(PurchaseOrder, :count).by(1)
  #   end
  # end

end
