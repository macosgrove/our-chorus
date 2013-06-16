OurChorus::Application.routes.draw do

  get "static_pages/our_vision"
  get "static_pages/our_values"
  get "static_pages/our_music"
  get "static_pages/our_practices"
  get "static_pages/grow_your_voice"
  get "static_pages/grow_your_group"

  devise_for :users, :path_prefix => 'my'
  resources :users do
    collection do
      get 'list'
    end
  end

  root :to => 'static_pages#our_vision'

end
