OurChorus::Application.routes.draw do

  get "static_pages/our_vision"
  get "static_pages/our_values"
  get "static_pages/our_music"
  get "static_pages/our_practices"
  get "static_pages/contact_us"
  get "static_pages/grow_your_voice"
  get "static_pages/grow_your_group"
  get "/grow-your-group" => "static_pages#grow_your_group"
  get "/grow-your-voice" => "static_pages#grow_your_voice"

  devise_for :users, :path_prefix => 'my', :controllers => { :registrations => "registrations" }
  devise_scope :user do
    get "/welcome" => "registrations#welcome"
  end
  resources :users do
    collection do
      get 'list'
    end
  end

  root :to => 'static_pages#our_vision'

end
