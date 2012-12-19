OurChorus::Application.routes.draw do

  get "static_pages/our_vision"
  get "static_pages/our_values"
  get "static_pages/our_music"
  get "static_pages/how_we_operate"

  devise_for :users
  devise_scope :user do
    get "/users/edit/:id" => "devise/registrations#edit"
    put "/users/:id" => "devise/registrations#update"
    delete "/users/:id" => "devise/registrations#destroy"
  end
  resources :users, only: [:show, :index]

  root :to => 'static_pages#our_vision'

end
