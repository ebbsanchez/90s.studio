Rails.application.routes.draw do
  root "main#index"
  get "about" => "main#about"
  resources :video
  resources :article
end