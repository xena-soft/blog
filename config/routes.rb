Rails.application.routes.draw do
  namespace :api do
    resources :posts do
      collection do
        get 'get_authors'
      end
    end
  end
end
