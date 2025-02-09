Rails.application.routes.draw do
  devise_for :users, only: :sessions

# * skip: tell which controller you want to skip routes from being created.
#   It accepts :all as an option, meaning it will not generate any route at all:

#     devise_for :users, skip: :sessions

  mount Mercury::Engine => '/'
  root "main#index"
  get "about" => "main#about"
  resources :videos
  resources :articles do
  	put 'mercury_update', on: :member
  end
end