Rails.application.routes.draw do
  namespace :api do
    # get 'posts_authors' => 'posts#get_authors'
    resources :posts do
      collection do
        get 'get_authors'
      end
    end
  end
end
