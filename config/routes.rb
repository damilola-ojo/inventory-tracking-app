Rails.application.routes.draw do
  resources :inventories, except: :show do
    resources :items
    resources :locations
  end
  
  root "inventories#index"
end
