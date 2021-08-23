Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "home#index"
  get '/portfolio', to: "home#portfolio"
  get 'about-me', to: "home#about_me"
  # get 'contact-me', to: "home#contact"
  resources :contacts, only: [:new, :create]
  resources :eurekods
  resources :users
  namespace :portfolio do
    resources :projects, except: :index
    get 'web-dev', to: 'projects#index' #SEO aim => to have explicit slug.
    resources :designs
  end
  
end
