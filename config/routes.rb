Rails.application.routes.draw do
  root "main#index"
  get "about" => "main#about"
  get "video" => "main#video"
  get "article" => "main#article"
end
