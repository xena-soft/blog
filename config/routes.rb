Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :posts do
      member do
        post :rating
      end
    end
    get 'posts/top_posts' => 'posts#top_posts'
  end
end
