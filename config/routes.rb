Rails.application.routes.draw do
  resources :inventories, except: :show do
    resources :items, except: :index
    resources :locations
  end
end
