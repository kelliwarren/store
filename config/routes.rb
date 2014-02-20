Store::Application.routes.draw do
  

  resources :customers

  resources :products do
    resources :categories
  end

  resources :categories
end
