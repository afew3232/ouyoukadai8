Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  resources :favorites, only: [:create,:destroy]
  resources :relationships, only: [:create,:destroy]
  get 'relationships/follow'
  get 'relationships/followed'

  post 'favorites/:id', to: "favorites#create"
  resources :book_comments, only: [:create,:destroy]

  get 'search/search'

  root 'home#top'
  get 'home/about'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

end