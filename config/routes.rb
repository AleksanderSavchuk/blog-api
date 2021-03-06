Rails.application.routes.draw do
  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      resources :posts
      resources :comments, only: [:create]
    end
  end
end
