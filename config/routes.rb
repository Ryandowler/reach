Rails.application.routes.draw do
  get 'books/about'
  
  get 'books/newest'
  get 'books/needs_love'
  get 'books/favourites_of_the_day'
  get 'books/near_you'
  get 'books/not_asking_for_much'
  get 'books/most_loved'

  get 'books/payment_cancel'
  resources :user_profiles
  resources :charges
  resources :resources
  resources :examples
  devise_for :users
  resources :books do
    member do
      put :like, to:'books#upvote'
      put :dislike, to:'books#downvote'

    end
  end
  root 'books#index'


 resources :conversations do
  resources :messages
 end

end
