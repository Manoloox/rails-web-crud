Rails.application.routes.draw do
  #get 'welcome/index'
  get 'articles/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles

  #root 'welcome#index'
  root 'articles#index'
end
