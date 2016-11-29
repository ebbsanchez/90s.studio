Rails.application.routes.draw do
  root "main#index"
  get "about" => "main#about"
  get "video" => "main#video"
  resources :article
end