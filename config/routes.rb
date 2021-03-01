Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  namespace :api do
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    # comments
    get "/comments" => "comments#index"
    get "/comments/:id" => "comments#show"
    post "/comments" => "comments#create"
    patch "/comments/:id" => "comments#update"
    delete "/comments/:id" => "comments#delete"
  end
end
