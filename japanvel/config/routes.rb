Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'bookmarks', to: 'homes#bookmarks'
  get 'about', to: 'homes#about'

  get 'users/mypage', to: 'users#show'
  patch 'users/mypage', to: 'users#update'
  get 'users/mypage/edit', to: 'users#edit'
  get 'users/mypage/verify', to: 'users#verify'
  patch 'users/mypage/withdrawl', to: 'users#withdrawl'

  get 'search', to: 'posts#search'
  resources :posts, only: [:index, :create, :edit, :update, :destroy] do
    resource :bookmarks, only: [:create, :destroy]
  end

  resources :prefectures, only: [:show]

end