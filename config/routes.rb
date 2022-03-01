Rails.application.routes.draw do
  resources :shops do
    resources :mattresses, shallow: true
  end

  root 'shops#new'
  #get '/shops/:shop_id/mattresses' => 'mattresses#index', as: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
