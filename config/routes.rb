Rails.application.routes.draw do
  root :to => 'sales#index'
  resources :sales
  post 'sales/upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
